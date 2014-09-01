import 'dart:html';
import 'package:logging/logging.dart';
import 'package:dartemis/dartemis.dart';
import 'package:polymer/polymer.dart';
import 'app/view.dart';
import 'app/terrian.dart';
import 'app/systems.dart';

class App {

  static final Logger log = new Logger('PraxisLog');
  static final num TILE_WIDTH = 50;
  static final num TILE_HEIGHT = 50;
  static final num SCROLL_SPEED = 7;

  World world;
  Terrian terrian;
  KeyboardInput keyboardInput;
  View view;
  GroupManager groupManager = new GroupManager();

  App() {

    initPolymer().run(() {

      // configure logging to output to console
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((LogRecord rec) {
        print('${rec.level.name}: ${rec.time}: ${rec.message}');
      });

      log.info("Application started");

      // create a debug element
      querySelector('#ui').children.add(new Element.tag('click-counter'));

      // wrapper around Pixi rendering
      view = new View();

      // dartemis setup
      world = new World();
      world.addManager(groupManager);
      world.addSystem(new KeyboardInput());
      world.addSystem(new RenderTiles(view, groupManager));
      world.addSystem(new ViewScroll(view));
      world.initialize();

      // loads data
      terrian = new Terrian(world, view, groupManager);

      // start the main game loop
      window.requestAnimationFrame(this._gameLoop);

    });

  }

  void _gameLoop(var num) {
    world.process();
    world.delta = 1.0 / 60.0 * 100;
    view.render();
    window.requestAnimationFrame(this._gameLoop);
  }

}

void main() {
  new App();
}