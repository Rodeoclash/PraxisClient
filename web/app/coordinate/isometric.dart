part of coordinate;

class Isometric extends Coordinate {

  Isometric(x, y):super(x, y) {

  }

  Cartisan toCartesian() {
    return new Cartisan((2 * y + x) / 2, (2 * y - x) / 2);
  }

  Cell toCell() {
    return toCartesian().toCell();
  }

  List<String> groupNeighbors() {
    return toCell().groupNeighbors();
  }

  String group() {
    return toCell().group();
  }

}