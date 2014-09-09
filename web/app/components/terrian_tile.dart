part of components;

class TerrianTile extends ComponentPoolable {

  Map data;
  Coordinate.Isometric coordinateIsometric;
  Coordinate.Cell coordinateCell;
  Sprite sprite;
  num offsetX;
  num offsetY;

  TerrianTile._();

  factory TerrianTile(Map data, Coordinate.Cell coordinate) {
    TerrianTile component = new Poolable.of(TerrianTile, _constructor);
    component.sprite = new Sprite.fromImage(data['imagePath']);
    component.coordinateCell = coordinate;
    component.coordinateIsometric = coordinate.toIsometric();
    return component;
  }

  static TerrianTile _constructor() => new TerrianTile._();

}