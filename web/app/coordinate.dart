library coordinate;

import 'view.dart';

part 'coordinate/cell.dart';
part 'coordinate/cartisan.dart';
part 'coordinate/isometric.dart';

abstract class Coordinate {
  num x, y;

  Coordinate(this.x, this.y) {

  }

}