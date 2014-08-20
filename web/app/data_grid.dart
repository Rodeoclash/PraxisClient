library grid;

import 'coordinate.dart' as Coordinate;

class DataGrid {

  List<List> data;

  DataGrid(this.data) {

  }

  void forEachRow(cb) {
    for (var r = 0; r < height(); r++) {
      cb.call(data[r], r);
    }
  }

  void forEachCell(cb) {
    forEachRow((List rowData, num rowIdx) {
      for (var c = 0; c < width(); c++) {
        cb.call(rowData[c], new Coordinate.Cell(c, rowIdx));
      }
    });
  }

  void forEachRowBetween(s, f, cb) {
    var count = 0;
    forEachRow((List rowData, num rowIdx) {
      if (rowIdx >= s && rowIdx <= f) {
        cb(rowData, count);
        count += 1;
      }
    });
  }

  num width() {
    return data[0].length;
  }

  num height() {
    return data.length;
  }

}
