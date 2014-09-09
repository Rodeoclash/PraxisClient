part of systems;

class TerrianEditor extends VoidEntitySystem {

  PraxisTerrianEditorElement terrianEditorElement;

  TerrianEditor() : super();

  void initialize() {
    terrianEditorElement = new Element.tag('praxis-terrian-editor');
    terrianEditorElement.hidden = true;
    querySelector('#ui').children.add(terrianEditorElement);
    terrianEditorElement.world = world;
    App.log.info('Initialized terrian editor system');
  }

  void processSystem() {

  }

  void processEntity(Entity entity) {
    // noop
  }

  void toggle() {
    terrianEditorElement.hidden = !terrianEditorElement.hidden;
  }

}