library terrian;

import 'dart:math';
import 'package:dartemis/dartemis.dart';
import 'data_grid.dart';
import 'view.dart';
import 'coordinate.dart' as Coordinate;
import 'components.dart';

class Terrian {

  static final FAKE_DATA_WIDTH = 16;
  static final FAKE_DATA_HEIGHT = 16;

  World world;
  View view;
  DataGrid terrianData;
  GroupManager groupManager;

  Terrian(this.world, this.view, this.groupManager) {

    // generate a set of entities for the random terrian
    terrianData = new DataGrid(_randomTerrian());

    // listen to scroll events and register terrian tiles
    // view.onScroll.listen(_viewScrolled);

    // add entities based on visible data
    terrianData.forEachCell(View.GROUP_SIZE, (Map data, List<String>groupLabels, Coordinate.Cell coordinate) {
      var entity = world.createEntity();
      entity.addComponent(new Tile(data, coordinate.toIsometric()));
      world.addEntity(entity);
      for (String groupLabel in groupLabels) {
        groupManager.add(entity, groupLabel);
      }
    });

  }

  void _viewScrolled() {
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