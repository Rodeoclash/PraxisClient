library grid;

import 'coordinate.dart' as Coordinate;

class DataGrid {

  List<List> data;

  DataGrid(this.data);

  void forEachRow(cb) {
    for (var r = 0; r < height(); r++) {
      cb.call(data[r], r);
    }
  }

  void forEachCell(num groupSize, cb) {
    forEachRow((List rowData, num rowIdx) {
      for (var c = 0; c < width(); c++) {
        num gX = (c / groupSize).floor();
        num gY = (rowIdx / groupSize).floor();
        cb.call(rowData[c], [
                              '${gX},${gY}',
                              '${gX+1},${gY}',
                              '${gX-1},${gY}',
                              '${gX},${gY+1}',
                              '${gX},${gY-1}',
                              '${gX-1},${gY-1}',
                              '${gX+1},${gY+1}'
                            ]
        , new Coordinate.Cell(c, rowIdx));
      }
    });
  }

  void forSubGrid(bounds, cb) {
    for (num rowCount = bounds.topLeftCell.y; rowCount <= bounds.bottomRightCell.y; rowCount++) {
      for (num colCount = bounds.topLeftCell.x; colCount <= bounds.bottomRightCell.x; colCount++) {
        cb(data[rowCount][colCount], new Coordinate.Cell(colCount, rowCount));
      }
    }
  }

  num width() {
    return data[0].length;
  }

  num height() {
    return data.length;
  }

}
