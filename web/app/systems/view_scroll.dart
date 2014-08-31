part of systems;

class ViewScroll extends VoidEntitySystem {

  View view;

  ViewScroll(this.view);

  void initialize() {
    App.log.info('Initialized view scroll system');
  }

  void processSystem() {

    KeyboardInput keyboardInputSystem = world.getSystem(KeyboardInput);

    if (keyboardInputSystem.keyDown(87)) {
      view.scrollUp();
    }
    if (keyboardInputSystem.keyDown(65)) {
      view.scrollLeft();
    }
    if (keyboardInputSystem.keyDown(83)) {
      view.scrollDown();
    }
    if (keyboardInputSystem.keyDown(68)) {
      view.scrollRight();
    }

  }

}