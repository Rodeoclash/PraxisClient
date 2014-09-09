part of components;

class TileNavigator extends ComponentPoolable {

  Entity n;
  Entity ne;
  Entity e;
  Entity se;
  Entity s;
  Entity sw;
  Entity w;
  Entity nw;

  TileNavigator._();

  factory TileNavigator(Entity n, Entity ne, Entity e, Entity se, Entity s, Entity sw, Entity w, Entity nw) {
    TileNavigator component = new Poolable.of(TerrianTile, _constructor);
    component.n = n;
    component.ne = ne;
    component.e = e;
    component.se = se;
    component.s = s;
    component.sw = sw;
    component.w = w;
    component.nw = nw;
    return component;
  }

  static TileNavigator _constructor() => new TileNavigator._();

}