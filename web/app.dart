import 'dart:html';
import 'package:logging/logging.dart';
import 'package:dartemis/dartemis.dart';
import 'app/terrian.dart';
import 'app/view.dart';
import 'app/systems.dart';

class App {

  static final Logger log = new Logger('PraxisLog');
  World world;
  View view;
  Terrian terrian;
  KeyboardInput keyboardInput;

  App() {

    // configure logging to output to console
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    log.info("Application started");

    view = new View();

    world = new World();
    world.addSystem(new KeyboardInput());
    world.addSystem(new RenderTile(view));
    world.addSystem(new ViewScroll(view));
    world.initialize();

    terrian = new Terrian(world, view);

    // start the main game loop
    window.requestAnimationFrame(this._gameLoop);

  }

  void _gameLoop(var num) {
    view.clear();
    world.process();
    view.render();
    window.requestAnimationFrame(this._gameLoop);
  }

}

void main() {
  new App();
}