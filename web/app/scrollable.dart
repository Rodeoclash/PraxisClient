library scrollable;

import 'coordinate.dart' as Coordinate;

class Scrollable {

  int scrollSpeed = 1;
  int scrollOffsetX = 0;
  int scrollOffsetY = 0;

  void scrollUp() {
    scrollOffsetY -= scrollSpeed;
  }

  void scrollDown() {
    scrollOffsetY += scrollSpeed;
  }

  void scrollLeft() {
    scrollOffsetX -= scrollSpeed;
  }

  void scrollRight() {
    scrollOffsetX += scrollSpeed;
  }

  Coordinate.Isometric scrollOffsetToIsometric() {
    return new Coordinate.Isometric(scrollOffsetX, scrollOffsetY);
  }

}