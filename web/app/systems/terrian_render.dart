part of systems;

class TerrianRender extends EntityProcessingSystem with Scrollable {

  ComponentMapper<TerrianTile> tileMapper;
  GroupManager groupManager;
  WebGLRenderer renderer;
  Stage stage;
  DisplayObjectContainer terrianTileContainer;
  double centreOffsetX;
  double centreOffsetY;

  TerrianRender(this.groupManager, this.stage, this.renderer) : super(Aspect.getAspectForAllOf([TerrianTile]));

  void initialize() {
    scrollSpeed = 7;
    tileMapper = new ComponentMapper<TerrianTile>(TerrianTile, world);
    terrianTileContainer = new DisplayObjectContainer();
    this.stage.children.add(terrianTileContainer);
    App.log.info('Initialized terrian render system');
  }

  void begin() {
    terrianTileContainer.children.clear();
  }

  void processEntities(Iterable<Entity> entities) {

    // determine offsets required to center the display
    centreOffsetX = renderer.view.width / 2 - App.TILE_WIDTH;
    centreOffsetY = renderer.view.height / 2 - App.TILE_HEIGHT;

    // output debugging data to the debug element
    var debuggingSystem = (world.getSystem(Debugging) as Debugging);
    debuggingSystem.debugElement.terrianOffsetXPx = scrollOffsetX;
    debuggingSystem.debugElement.terrianOffsetYPx = scrollOffsetY;
    debuggingSystem.debugElement.topLeftCellX = _topLeftCell().x;
    debuggingSystem.debugElement.topLeftCellY = _topLeftCell().y;
    debuggingSystem.debugElement.bottomRightCellX = _bottomRightCell().x;
    debuggingSystem.debugElement.bottomRightCellY = _bottomRightCell().y;

    List<TerrianTile> displayTiles = new List();

    // build a list of entities for rendering from groups
    for (var groupName in scrollOffsetToIsometric().groupNeighbors()) {
      for (var entity in groupManager.getEntities(groupName)) {
        displayTiles.add(tileMapper.get(entity));
      }
    }

    // cull then sort tiles
    displayTiles
      .where((tile) => _tileOnScreen(tile))
      .toList()
      .sort((a, b) => _compareTiles(a, b));

    // add the tiles to the display container
    for (var tile in displayTiles) {
      tile.sprite.position = _tilePosition(tile);
      terrianTileContainer.children.add(tile.sprite);
    }

  }

  void processEntity(Entity entity) {
    // noop
  }

  bool _tileOnScreen(TerrianTile tile) {
    return _tileOnScreenX(tile) && _tileOnScreenY(tile);
  }

  bool _tileOnScreenX(TerrianTile tile) {
    return tile.coordinateIsometric.x > _topLeftCell().x && tile.coordinateIsometric.x < _bottomRightCell().x;
  }

  bool _tileOnScreenY(TerrianTile tile) {
    return tile.coordinateIsometric.y > _topLeftCell().y && tile.coordinateIsometric.y < _bottomRightCell().y;
  }

  Point _tilePosition(TerrianTile tile) {
    return new Point(
      tile.coordinateIsometric.x + scrollOffsetX * -1 + centreOffsetX,
      tile.coordinateIsometric.y + scrollOffsetY * -1 + centreOffsetY
    );
  }

  int _compareTiles(TerrianTile a, TerrianTile b) {
    if (a.coordinateIsometric.y > b.coordinateIsometric.y){
      return 1;
    } else if (a.coordinateIsometric.x > b.coordinateIsometric.x) {
      return -1;
    } else {
      return -1;
    }
  }

  Coordinate.Cell _topLeftCell() {
    return new Coordinate.Isometric(
        scrollOffsetToIsometric().x - centreOffsetX,
        scrollOffsetToIsometric().y - centreOffsetY
    ).toCell();
  }

  Coordinate.Cell _bottomRightCell() {
    return new Coordinate.Isometric(
        scrollOffsetToIsometric().x + renderer.view.width - centreOffsetX,
        scrollOffsetToIsometric().y + renderer.view.height - centreOffsetY
    ).toCell();
  }

}