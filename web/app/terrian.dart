library zone;

import 'dart:math';
import 'package:dartemis/dartemis.dart';
import 'data_grid.dart';
import 'coordinate.dart' as Coordinate;
import 'view.dart';
import 'components.dart';

class Terrian {

  static final FAKE_DATA_WIDTH = 64;
  static final FAKE_DATA_HEIGHT = 64;
  World world;
  View view;
  List<Entity> tiles = new List();

  Terrian(this.world, this.view) {

    // generate a set of entities for the random terrian
    var terrianDataGrid = new DataGrid(_randomTerrian());

    terrianDataGrid.forEachCell((Map data, Coordinate.Cell coordinateCell) {
      var entity = world.createEntity();
      entity.addComponent(new Tile(data, coordinateCell, view));
      tiles.add(entity);
      world.addEntity(entity);
    });

  }

  List _randomTerrian() {

    var rng = new Random(1);
    var data = new List(FAKE_DATA_HEIGHT);

    // stub array out
    for (var i=0; i < data.length; i++) {
      data[i] = new List(FAKE_DATA_WIDTH);
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