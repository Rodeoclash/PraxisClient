part of systems;

class KeyboardInput extends VoidEntitySystem {

  Map<num, bool> keysDown = {};

  KeyboardInput();

  void initialize() {
    App.log.info('Initialized keyboard input system');
    document.body.onKeyDown.listen(_onKeyDown);
    document.body.onKeyUp.listen(_onKeyUp);
  }

  void processSystem() {

  }

  bool keyDown(num keyCode) {
    return keysDown[keyCode] == true;
  }

  void _onKeyDown(KeyboardEvent e) {
    //App.log.info("Key down: ${e.keyCode}");
    keysDown[e.keyCode] = true;
  }

  void _onKeyUp(KeyboardEvent e) {
    //App.log.info("Key up: ${e.keyCode}");
    keysDown[e.keyCode] = false;
  }

}