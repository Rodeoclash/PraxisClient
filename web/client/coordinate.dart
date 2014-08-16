library coordinates;
import 'dart:math';
import 'display.dart';

abstract class Coordinate {
  num x;
  num y;

  Point toPoint() {
    return new Point(this.x, this.y);
  }

}

class CellCoordinate extends Coordinate {
  num x;
  num y;

  CellCoordinate(this.x, this.y) {

  }

  CartisanCoordinate toCartesian() {
    return new CartisanCoordinate(x * Display.TILE_WIDTH, y *
        Display.TILE_HEIGHT);
  }

  IsometricCoordinate toIsometric() {
    return toCartesian().toIsometric();
  }

}

class CartisanCoordinate extends Coordinate {
  num x;
  num y;

  CartisanCoordinate(this.x, this.y) {

  }

  IsometricCoordinate toIsometric() {
    return new IsometricCoordinate(x - y, (x + y) / 2);
  }

  CellCoordinate toCell() {
    return new CellCoordinate((x / Display.TILE_HEIGHT).round() - 1, (y / Display.TILE_HEIGHT).round());
  }

}

class IsometricCoordinate extends Coordinate {
  num x;
  num y;

  IsometricCoordinate(this.x, this.y) {

  }

  CartisanCoordinate toCartesian() {
    return new CartisanCoordinate((2 * y + x) / 2, (2 * y - x) / 2);
  }

  CellCoordinate toCell() {
    return toCartesian().toCell();
  }

}
