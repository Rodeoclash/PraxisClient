part of layer;

class Terrian extends Layer {

  Terrian(Response.Terrian response, Display display) : super(response, display) {

    // replace data grid with tile instances
    forEachCell( (Map tileData, CellCoordinate coordinates) {
      data[coordinates.y][coordinates.x] = new Tile(tileData, coordinates, display);
    });

  }

  void render(Display display) {

    forEachCell( (Tile tile, CellCoordinate coordinates) {

      // is the mouse over this tile?
      if (display.mouseInput.mouseCoordinates != null && display.mouseInput.mouseCoordinates.toCell().toPoint() == coordinates.toPoint()) {
        tile.sprite.alpha = 0.5;
      } else {
        tile.sprite.alpha = 1.0;
      }

      tile.sprite.position = new Point(tile.positionX(), tile.positionY());

      // add to the stage if within render area
      if (tile.isOnScreen()) {
        display.tileContainer.children.add(tile.sprite);
      }

    });

  }

}