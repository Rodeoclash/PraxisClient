library grid;

import 'coordinate.dart' as Coordinate;

class DataMatrix {

  List<List<Map>> inputData;
  List<List<Map>> data;
  int groupSize;
  int width;
  int height;

  DataMatrix(this.inputData, Function klass) {
    width = inputData[0].length;
    height = inputData.length;
    data = new List(width).map( (_) => new List(height) ).toList();
    _forEach(inputData, (Map entry, Coordinate.Cell coordinate) {
      data[coordinate.y][coordinate.x] = klass.call();
    });
  }

  void forEach (Function cb) {
    _forEach(data, (entry, Coordinate.Cell coordinate) {

      var n, ne, e, se, s, sw, w, nw;

      if ( _canNorth(coordinate) ) {
        n = data[coordinate.y - 1][coordinate.x];
      }

      if ( _canNorth(coordinate) && _canEast(coordinate) ) {
        ne = data[coordinate.y - 1][coordinate.x + 1];
      }

      if ( _canEast(coordinate) ) {
        e = data[coordinate.y][coordinate.x + 1];
      }

      if ( _canSouth(coordinate) && _canEast(coordinate) )  {
        se = data[coordinate.y + 1][coordinate.x + 1];
      }

      if ( _canSouth(coordinate) ) {
        s = data[coordinate.y + 1][coordinate.x];
      }

      if ( _canSouth(coordinate) && _canWest(coordinate) ) {
        sw = data[coordinate.y + 1][coordinate.x - 1];
      }

      if ( _canWest(coordinate) ) {
        w = data[coordinate.y][coordinate.x - 1];
      }

      if ( _canNorth(coordinate) && _canWest(coordinate) ) {
        nw = data[coordinate.y - 1][coordinate.x - 1];
      }

      cb.call(
          entry, // data
          inputData[coordinate.y][coordinate.x],
          coordinate, // cell position
          n,
          ne,
          e,
          se,
          s,
          sw,
          w,
          nw
      );
    });
  }

  void _forEach(List<List<Map>> list, Function cb) {
    for (var r = 0; r < list.length; r++) {
      for (var c = 0; c < list[r].length; c++) {
        cb.call(list[r][c], new Coordinate.Cell(c, r));
      }
    }
  }

  bool _canNorth (coordinate) {
    return coordinate.y - 1 >= 0;
  }

  bool _canEast (coordinate) {
    return coordinate.x + 1 <= width - 1;
  }

  bool _canSouth (coordinate) {
    return coordinate.y + 1 <= height - 1;
  }

  bool _canWest (coordinate) {
    return coordinate.x - 1 >= 0;
  }

}
