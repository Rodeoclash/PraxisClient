part of systems;

class Scrolling extends VoidEntitySystem {

  Scrolling() : super();

  void initialize() {
    App.log.info('Initialized scrolling system');
  }

  void processSystem() {

    KeyboardInput keyboardInputSystem = world.getSystem(KeyboardInput);
    TerrianRender terrianRenderSystem = world.getSystem(TerrianRender);

    if (keyboardInputSystem.keyDown(87)) {
      terrianRenderSystem.scrollUp();
    }
    if (keyboardInputSystem.keyDown(65)) {
      terrianRenderSystem.scrollLeft();
    }
    if (keyboardInputSystem.keyDown(83)) {
      terrianRenderSystem.scrollDown();
    }
    if (keyboardInputSystem.keyDown(68)) {
      terrianRenderSystem.scrollRight();
    }

  }

}