part of coordinate;

class Cell extends Coordinate {

  Cell(x, y):super(x, y) {

  }

  Cartisan toCartesian() {
    return new Cartisan(x * App.TILE_WIDTH, y * App.TILE_HEIGHT);
  }

  Isometric toIsometric() {
    return toCartesian().toIsometric();
  }

}