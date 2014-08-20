library view;

import 'dart:html';
import 'package:pixi/pixi.dart';
import 'coordinate.dart' as Coordinate;

part 'view/offset.dart';

class View {

  static final num TILE_WIDTH = 50;
  static final num TILE_HEIGHT = 50;

  WebGLRenderer renderer;
  Stage stage;
  Offset offset;

  View() {

    // handle smooth scrolling
    offset = new Offset();

    // renderer and append to stage
    renderer = new WebGLRenderer(interactive: true);
    document.body.append(this.renderer.view);

    // stage
    stage = new Stage(new Colour.fromHtml('#fcf'));

    // detect changes in screen size resize the rendering area
    window.onResize.forEach( (e) { _resizeRendererToClient(); });

    // trigger resize on load
    _resizeRendererToClient();

  }

  void _resizeRendererToClient() {
    renderer.resize(window.innerWidth, window.innerHeight);
  }

  void clear() {
    stage.children.clear();
  }

  void render() {
    this.renderer.render(stage);
  }

  num widthOffset() {
    return screenWidthPx() / 2 - TILE_WIDTH;
  }

  num heightOffset() {
    return screenHeightPx() / 2 - TILE_WIDTH;
  }

  num screenWidthPx() {
    return window.innerWidth;
  }

  num screenHeightPx() {
    return window.innerHeight;
  }

  num viewDistance() {
    return screenHeightPx() / TILE_WIDTH * 2;
  }

  bool cellCoordinateOnScreen(Coordinate.Cell coordinate) {
    return cellCoordinateOnScreenX(coordinate) && cellCoordinateOnScreenY(coordinate);
  }

  bool cellCoordinateOnScreenX(Coordinate.Cell coordinate) {
    var cellOffset = offset.cellCoordinate();
    return coordinate.x >= cellOffset.x && coordinate.x <= cellOffset.x + viewDistance();
  }

  bool cellCoordinateOnScreenY(Coordinate.Cell coordinate) {
    var cellOffset = offset.cellCoordinate();
    return coordinate.y >= cellOffset.y && coordinate.y <= cellOffset.y + viewDistance();
  }

}
