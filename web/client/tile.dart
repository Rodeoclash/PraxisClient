library tile;

import 'package:pixi/pixi.dart';
import 'display.dart';
import 'coordinate.dart';

class Tile {

  Map data;
  Sprite sprite;
  CellCoordinate coordinate;
  Display display;

  Tile(this.data, this.coordinate, this.display) {
    sprite = hasImagePath() ? makeSpriteFromImagePath() : makeBlankSprite();
  }

  Sprite makeBlankSprite() {
    return new Sprite.fromImage('images/tiles/blank.png');
  }

  Sprite makeSpriteFromImagePath() {
    return new Sprite.fromImage(imagePath());
  }

  num positionX() {
    return coordinate.toIsometric().x + data['offset'][0] + display.widthOffset() - display.scroll.offset.x;
  }

  num positionY() {
    return coordinate.toIsometric().y + data['offset'][1] - display.heightOffset() - display.scroll.offset.y;
  }

  bool hasImagePath() {
    return imagePath() != null;
  }

  String imagePath() {
    return data['imagePath'];
  }

  bool isOnScreen() {
    return _isOnScreenX() && _isOnScreenY();
  }

  bool _isOnScreenX() {
    var cellOffset = display.scroll.cellCoordinate();
    return coordinate.x >= cellOffset.x && coordinate.x <= cellOffset.x + display.viewDistance();
  }

  bool _isOnScreenY() {
    var cellOffset = display.scroll.cellCoordinate();
    return coordinate.y >= cellOffset.y && coordinate.y <= cellOffset.y + display.viewDistance();
  }

}