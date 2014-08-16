part of display;

class Scroll {

  Point offset;
  Display display;
  ParagraphElement debugScollOffsetPx;
  ParagraphElement debugScollOffsetCell;

  Scroll(this.display) {
    offset = new Point(0,0);
    debugScollOffsetPx = querySelector('#scrollOffsetPx');
    debugScollOffsetCell = querySelector('#scrollOffsetCell');
  }

  void up([int speed=7]) {
    offset = new Point(offset.x, offset.y - speed);
    checkBounds();
  }

  void down([int speed=7]) {
    offset = new Point(offset.x, offset.y + speed);
    checkBounds();
  }

  void left([int speed=7]) {
    offset = new Point(offset.x - speed, offset.y);
    checkBounds();
  }

  void right([int speed=7]) {
    offset = new Point(offset.x + speed, offset.y);
    checkBounds();
  }

  CellCoordinate cellCoordinate() {
    return new IsometricCoordinate(offset.x, offset.y).toCell();
  }

  void checkBounds() {
    debugScollOffsetPx.text = "x${offset.x}px, y${offset.y}px";
    debugScollOffsetCell.text = "x${cellCoordinate().x}, y${cellCoordinate().y}";
  }

}