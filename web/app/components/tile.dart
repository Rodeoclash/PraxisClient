part of components;

class Tile extends ComponentPoolable {

  Map data;
  Coordinate.Isometric coordinate;
  Sprite sprite;
  num offsetX;
  num offsetY;

  Tile._();

  factory Tile(Map data, Coordinate.Isometric coordinate) {
    Tile tile = new Poolable.of(Tile, _constructor);
    tile.sprite = new Sprite.fromImage(data['imagePath']);
    tile.coordinate = coordinate;
    tile.offsetX =  data['offset'][0];
    tile.offsetY =  data['offset'][1];
    return tile;
  }

  static Tile _constructor() => new Tile._();

}