part of coordinate;

class Cartisan extends Coordinate {

  Cartisan(x, y):super(x, y) {

  }

  Cell toCell() {
    return new Cell((x / View.TILE_HEIGHT).round() - 1, (y / View.TILE_HEIGHT).round());
  }

  Isometric toIsometric() {
    return new Isometric(x - y, (x + y) / 2);
  }

}