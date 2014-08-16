part of display;

class MouseInput {

  Display display;
  IsometricCoordinate mouseCoordinates;
  ParagraphElement mousePositionCell;

  MouseInput(this.display) {
    mousePositionCell = querySelector('#mousePositionCell');
    display.tileContainer.onMouseMove.listen(_mouseMoved);
  }

  void _mouseMoved(InteractionEvent e) {
    mouseCoordinates = new IsometricCoordinate(e.x, e.y);
    mousePositionCell.text = "x${mouseCoordinates.toCell().x}, y${mouseCoordinates.toCell().y}";
  }

}