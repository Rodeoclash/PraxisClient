library grid;

import '../coordinate.dart';

abstract class Grid {

  List<List> data;

  void forEachRow(cb) {
    for (var r = 0; r < height(); r++) {
      cb.call(data[r], r);
    }
  }

  void forEachCell(cb) {
    forEachRow((List rowData, num rowIdx) {
      for (var c = 0; c < width(); c++) {
        cb.call(rowData[c], new CellCoordinate(c, rowIdx));
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

  void forSubGrid(num x1, num x2, num y1, num y2, cb) {
    forEachRowBetween(y1, y2, (List rowData, num rowIdx) {
      var count = 0;
      for (var c = 0; c < rowData.length; c++) {
        if (c >= x1 && c <= x2) {
          cb(rowData[c], new CellCoordinate(count, rowIdx));
          count += 1;
        }
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
