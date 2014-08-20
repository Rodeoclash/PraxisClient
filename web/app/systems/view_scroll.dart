part of systems;

class ViewScroll extends VoidEntitySystem {

  View view;

  ViewScroll(this.view) {
    App.log.info('Initialized view scroll system');
  }

  void processSystem() {
    KeyboardInput keyboardInputSystem = world.getSystem(KeyboardInput);
    if (keyboardInputSystem.keyDown(87)) {
      view.offset.up();
    }
    if (keyboardInputSystem.keyDown(65)) {
      view.offset.left();
    }
    if (keyboardInputSystem.keyDown(83)) {
      view.offset.down();
    }
    if (keyboardInputSystem.keyDown(68)) {
      view.offset.right();
    }
  }

}