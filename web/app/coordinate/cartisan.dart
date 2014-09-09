part of coordinate;

class Cartisan extends Coordinate {

  Cartisan(x, y):super(x, y) {

  }

  Cell toCell() {
    return new Cell((x / App.TILE_HEIGHT).floor(), (y / App.TILE_HEIGHT).floor());
  }

  Isometric toIsometric() {
    return new Isometric(x - y, (x + y) / 2);
  }

  String group() {
    return toCell().group();
  }

}