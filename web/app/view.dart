library view;

import 'dart:math';
import 'dart:html';
import 'dart:async';
import 'package:pixi/pixi.dart';
import '../app.dart';
import 'coordinate.dart' as Coordinate;

class View {

  static final GROUP_SIZE = 8;

  num offsetX = 0, offsetY = 0;
  Coordinate.Cell offset;
  Point topLeft;
  Point bottomRight;
  WebGLRenderer renderer;
  Stage stage;
  DisplayObjectContainer terrianContainer;
  num screenWidthPx, screenHeightPx, viewDistance;
  num widthOffset, heightOffset;
  StreamController onScrollController = new StreamController();
  Stream onScroll;

  View() {
    App.log.info('Initialized view');

    // renderer and append to stage
    renderer = new WebGLRenderer(interactive: true);

    document.body.append(this.renderer.view);

    // holds terrian tiles
    terrianContainer = new DisplayObjectContainer();

    // stage
    stage = new Stage(new Colour.fromHtml('#fcf'));
    stage.children.add(terrianContainer);

    // detect changes in screen size resize the rendering area
    window.onResize.forEach( (e) => _windowResized() );

    // trigger resize on load
    _windowResized();

    // event emitter for scrolling
    onScroll = onScrollController.stream;

    // trigger scroll
    _afterScroll();
  }

  void render() {
    this.renderer.render(stage);
  }

  void _windowResized() {
    renderer.resize(window.innerWidth, window.innerHeight);
    screenWidthPx = window.innerWidth;
    screenHeightPx = window.innerHeight;
    widthOffset = screenWidthPx / 2 - App.TILE_WIDTH;
    heightOffset = screenHeightPx / 2 - App.TILE_WIDTH;
    viewDistance = 1000;
  }

  String getGroup() {
    return "${(offset.x / GROUP_SIZE).floor()},${(offset.y / GROUP_SIZE).floor()}";
  }

  void scrollUp() {
    offsetY -= App.SCROLL_SPEED;
    _afterScroll();
  }

  void scrollDown() {
    offsetY += App.SCROLL_SPEED;
    _afterScroll();
  }

  void scrollLeft() {
    offsetX -= App.SCROLL_SPEED;
    _afterScroll();
  }

  void scrollRight() {
    offsetX += App.SCROLL_SPEED;
    _afterScroll();
  }

  void _afterScroll() {
    offset = new Coordinate.Isometric(offsetX, offsetY).toCell();
  }

}