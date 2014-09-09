library app;

import 'dart:html';
import 'package:dartemis/dartemis.dart';
import 'package:polymer/polymer.dart';
import 'package:pixi/pixi.dart';
import 'package:logging/logging.dart';
import 'app/systems.dart';

class App {

  static final int TILE_WIDTH = 50;
  static final int TILE_HEIGHT = 50;
  static final int TILE_GROUP_SIZE = 16;
  static final Logger log = new Logger('PraxisLog');

  WebGLRenderer renderer;
  Stage stage;
  World world;
  GroupManager groupManager = new GroupManager();
  num screenWidthPx, screenHeightPx, widthOffset, heightOffset;

  App() {

    // configure logging to output to console
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    log.info("Praxis started");

    // setup webgl for rendering
    renderer = new WebGLRenderer(interactive: true);
    stage = new Stage(new Colour.fromHtml('#fcf'));
    document.body.append(this.renderer.view);

    // detect window resizes
    window.onResize.forEach( (event) => _windowResized(event) );
    _windowResized();

    // all calls exist in a polymer zone for autoupdating
    initPolymer().run(() {

      world = new World();
      world.addManager(groupManager);
      world.addSystem(new Logging());
      world.addSystem(new Debugging());
      world.addSystem(new Dock());
      world.addSystem(new KeyboardInput());
      world.addSystem(new TerrianGenerator(groupManager));
      world.addSystem(new TerrianRender(groupManager, stage, renderer));
      world.addSystem(new TerrianEditor());
      world.addSystem(new Scrolling());
      world.initialize();

      log.info("It's too bad she won't live! But then again, who does?");

      // start the main game loop
      window.requestAnimationFrame(this._gameLoop);

    });

  }

  void _gameLoop(var num) {
    world.process();
    world.delta = 1.0 / 60.0 * 100; // assume running at 60fps
    this.renderer.render(stage);
    window.requestAnimationFrame(this._gameLoop);
  }

  void _windowResized([event]) {
    screenWidthPx = window.innerWidth;
    screenHeightPx = window.innerHeight;
    widthOffset = screenWidthPx / 2 - TILE_WIDTH;
    heightOffset = screenHeightPx / 2 - TILE_WIDTH;
    renderer.resize(screenWidthPx, screenHeightPx);
  }

}

void main() {
  new App();
}