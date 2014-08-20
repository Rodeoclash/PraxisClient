part of coordinate;

class Cell extends Coordinate {

  Cell(x, y):super(x, y) {

  }

  Cartisan toCartesian() {
    return new Cartisan(x * View.TILE_WIDTH, y * View.TILE_HEIGHT);
  }

  Isometric toIsometric() {
    return toCartesian().toIsometric();
  }

}