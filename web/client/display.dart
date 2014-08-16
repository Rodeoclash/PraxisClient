library display;

import 'dart:html';
import 'dart:async';
import 'package:pixi/pixi.dart';
import 'coordinate.dart';
import 'layer.dart' as Layer;

part 'display/scroll.dart';
part 'display/mouse_input.dart';

class Display {

  static final TILE_WIDTH = 50;
  static final TILE_HEIGHT = 50;
  StreamController renderLoopController = new StreamController.broadcast();
  Stream get renderLoop => renderLoopController.stream;

  WebGLRenderer renderer;
  Stage stage;
  DisplayObjectContainer tileContainer;
  List layers;

  DivElement stageElement;
  Scroll scroll;
  MouseInput mouseInput;

  Display() {

    // render layers
    layers = new List(2);

    // handle scrolling
    scroll = new Scroll(this);

    // renderer and append to stage
    renderer = new WebGLRenderer(interactive: true);
    document.body.append(this.renderer.view);

    // stage
    stage = new Stage(new Colour.fromHtml('#fcf'));

    // tile container
    tileContainer = new DisplayObjectContainer();
    stage.children.add(tileContainer);

    // start animation
    window.requestAnimationFrame(this._animate);

    // detect changes in screen size resize the rendering area
    window.onResize.forEach( (e) { _resizeRendererToClient(); });

    // trigger resize on load
    _resizeRendererToClient();

    // watch mouse events (requires tileContainer)
    mouseInput = new MouseInput(this);

  }

  void _resizeRendererToClient() {
    renderer.resize(window.innerWidth, window.innerHeight);
  }

  void setTerrianLayer(Layer.Terrian layer) {
    layers[0] = layer;
  }

  void addDecorationLayer(Layer.Decoration layer) {
    //layers[1] = layer;
  }

  void _animate(var num) {

    window.requestAnimationFrame(this._animate);

    renderLoopController.add('starting');

    // remove all sprites
    tileContainer.children.clear();

    // render each of the layers sprites
    for (var layer in layers) {
      if (layer != null) {
        layer.render(this);
      }
    }

    // render to tile container
    this.renderer.render(stage);

  }

  num widthOffset() {
    return screenWidthPx() / 2 - TILE_WIDTH;
  }

  num heightOffset() {
    //return 0;
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

}
