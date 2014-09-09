part of systems;

class KeyboardInput extends VoidEntitySystem {

  Map<num, bool> keysDown = {};

  KeyboardInput() : super();

  void initialize() {
    document.body.onKeyDown.listen(_onKeyDown);
    document.body.onKeyUp.listen(_onKeyUp);
    App.log.info('Initialized keyboard input system');
  }

  void processSystem() {

  }

  bool keyDown(num keyCode) {
    return keysDown[keyCode] == true;
  }

  void _onKeyDown(KeyboardEvent e) {
    keysDown[e.keyCode] = true;
  }

  void _onKeyUp(KeyboardEvent e) {
    keysDown[e.keyCode] = false;
  }

}