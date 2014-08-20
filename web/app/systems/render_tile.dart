part of systems;

class RenderTile extends EntityProcessingSystem {

  ComponentMapper<Tile> tileMapper;
  View view;

  RenderTile(this.view) : super(Aspect.getAspectForAllOf([Tile]));

  void initialize() {
    App.log.info('Initialized tile render system');
    tileMapper = new ComponentMapper<Tile>(Tile, world);
  }

  void processEntity(Entity entity) {

    // get components
    var tileComponent = tileMapper.get(entity);

    // if entity is no visible, do nothing
    if (!view.cellCoordinateOnScreen(tileComponent.coordinateCell)) {
      return;
    }

    var positionX = tileComponent.positionX();
    var positionY = tileComponent.positionY();

    // set position
    tileComponent.sprite.position = new Point(positionX, positionY);

    // add to the stage
    view.stage.children.add(tileComponent.sprite);

  }

}