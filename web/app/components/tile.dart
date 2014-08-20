part of components;

class Tile extends Component {

  Map data;
  Coordinate.Cell coordinateCell;
  Sprite sprite;
  View view;

  Tile(this.data, this.coordinateCell, this.view) {
    sprite = hasImagePath() ? makeSpriteFromImagePath() : makeBlankSprite();
  }

  Sprite makeBlankSprite() {
    return new Sprite.fromImage('images/tiles/blank.png');
  }

  Sprite makeSpriteFromImagePath() {
    return new Sprite.fromImage(imagePath());
  }

  bool hasImagePath() {
    return imagePath() != null;
  }

  String imagePath() {
    return data['imagePath'];
  }

  num offsetX() {
    return data['offset'][0];
  }

  num offsetY() {
    return data['offset'][1];
  }

  num positionX() {
    return coordinateCell.toIsometric().x + offsetX() + view.widthOffset() - view.offset.x;
  }

  num positionY() {
    return coordinateCell.toIsometric().y + offsetY() - view.heightOffset() - view.offset.y;
  }

}