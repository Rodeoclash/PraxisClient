part of view;

class Offset {

  static final num SPEED = 7;

  num x = 0, y = 0;

  Offset();

  void up() {
    y -= SPEED;
    checkBounds();
  }

  void down() {
    y += SPEED;
    checkBounds();
  }

  void left() {
    x -= SPEED;
    checkBounds();
  }

  void right() {
    x += SPEED;
    checkBounds();
  }

  Coordinate.Cell cellCoordinate() {
    return new Coordinate.Isometric(x, y).toCell();
  }

  void checkBounds() {
  }

}