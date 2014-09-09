part of systems;

class Dock extends VoidEntitySystem {

  PraxisDockElement dockElement;

  Dock() : super();

  void initialize() {
    dockElement = new Element.tag('praxis-dock');
    querySelector('#ui').children.add(dockElement);
    dockElement.world = world;
    App.log.info('Initialized dock system');
  }

  void processSystem() {

  }

  void processEntity(Entity entity) {
    // noop
  }

}