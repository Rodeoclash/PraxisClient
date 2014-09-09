part of systems;

class Debugging extends VoidEntitySystem {

  PraxisDebugElement debugElement;

  Debugging() : super();

  void initialize() {
    debugElement = new Element.tag('praxis-debug');
    debugElement.hidden = true;
    querySelector('#ui').children.add(debugElement);
    debugElement.world = world;
    App.log.info('Initialized debugging system');
  }

  void processSystem() {

  }

  void processEntity(Entity entity) {
    // noop
  }

  void toggle() {
    debugElement.hidden = !debugElement.hidden;
  }

}