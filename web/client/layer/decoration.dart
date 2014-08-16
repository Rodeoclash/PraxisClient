part of layer;

class Decoration extends Layer {

  Decoration(Response.Decoration response, Display display) : super(response, display);

  void render(Display display) {

    forEachCell( (Map tileData, CellCoordinate coordinates) {

      /*
      var tile = new Tile(tileData);

      // is the mouse over this tile?

      if (mousePosition != null && mousePosition.toCell().toPoint() == coordinates.toPoint()) {
        tile.sprite.alpha = 0.5;
      } else {
        tile.sprite.alpha = 1.0;
      }

      // determine where to place the tile
      var position = coordinates.toIsometric();
      position.x += tile.offsetX();
      position.y += tile.offsetY();
      tile.sprite.position = position.toPoint();

      // add to the stage
      display.tileContainer.children.add(tile.sprite);
      */

    });

  }

}