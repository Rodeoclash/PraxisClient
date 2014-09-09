part of systems;

class Logging extends VoidEntitySystem {

  Logging() : super();

  void initialize() {
    App.log.info('Initialized logging system');
  }

  void processSystem() {

  }

  void processEntity(Entity entity) {
    // noop
  }

}