part of systems;

class RenderTiles extends EntityProcessingSystem {

  ComponentMapper<Tile> tileMapper;
  View view;
  GroupManager groupManager;

  RenderTiles(this.view, this.groupManager) : super(Aspect.getAspectForAllOf([Tile]));

  void initialize() {
    App.log.info('Initialized tile render system');
    tileMapper = new ComponentMapper<Tile>(Tile, world);
  }

  void processEntities(Iterable<Entity> entities) {
    groupManager.getEntities(view.getGroup()).forEach((Entity entity) {
      Tile tile = tileMapper.get(entity);
      num positionX = tile.coordinate.x + tile.offsetX + view.widthOffset - view.offsetX;
      num positionY = tile.coordinate.y + tile.offsetY + view.heightOffset - view.offsetY;
      tile.sprite.position = new Point(positionX, positionY);
      view.terrianContainer.children.add(tile.sprite);
    });
  }

  void processEntity(Entity entity) {
    // noop
  }

  void begin() {
    view.terrianContainer.children.clear();
  }

}