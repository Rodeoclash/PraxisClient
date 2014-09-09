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

  String group() {
    return "${_groupX()},${_groupY()}";
  }

  List<String> groupNeighbors() {
    return [
      "${_groupX()},${_groupY()}", // center
      "${_groupX()},${_groupY() - 1}", // n
      "${_groupX() + 1},${_groupY() - 1}", // ne
      "${_groupX() + 1},${_groupY()}", // e
      "${_groupX() + 1},${_groupY() + 1}", // se
      "${_groupX()},${_groupY() + 1}", // s
      "${_groupX() - 1},${_groupY() + 1}", // sw
      "${_groupX() - 1},${_groupY()}", // w
      "${_groupX() - 1},${_groupY() - 1}" // nw
    ];
  }

  int _groupX() {
    return (x / App.TILE_GROUP_SIZE).floor();
  }

  int _groupY() {
    return (y / App.TILE_GROUP_SIZE).floor();
  }

}