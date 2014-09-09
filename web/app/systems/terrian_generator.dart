part of systems;

class TerrianGenerator extends VoidEntitySystem {

  GroupManager groupManager;

  TerrianGenerator(this.groupManager) : super();

  void initialize() {

    // create the matrix and populate with entities
    var terrianMatrix = new DataMatrix(
        _randomTerrianData(16, 16),
        world.createEntity
    );

    // for each cell in the matrix create entities, this translates the
    // 2d array into a single linked list for performance
    terrianMatrix.forEach((
                           Entity entity,
                           Map data,
                           Coordinate.Cell coordinate,
                           Entity n,
                           Entity ne,
                           Entity e,
                           Entity se,
                           Entity s,
                           Entity sw,
                           Entity w,
                           Entity nw
    ) {
      entity.addComponent(new TerrianTile(data, coordinate));
      entity.addComponent(new TileNavigator(n, ne, e, se, s, sw, w, nw));
      groupManager.add(entity, coordinate.group());
      world.addEntity(entity);
    });

    App.log.info('Initialized terrian generator system');
  }

  void processSystem() {

  }

  List<List<Map>> _randomTerrianData(num width, num height) {

    var rng = new Random(1);
    var data = new List(width);

    // stub array out
    for (var i=0; i < data.length; i++) {
      data[i] = new List(height);
    }

    // populate with random values
    for (var r=0; r < data.length; r++) {
      for (var c=0; c < data[r].length; c++) {
        var tile = rng.nextInt(2);
        var offsetY = rng.nextInt(7);;
        data[r][c] = {
          "imagePath": "images/tiles/terrian/$tile.png",
          "offset": [0, offsetY * -1]
        };
      }
    }

    return data;

  }

}