library debug;

import 'package:polymer/polymer.dart';
import 'package:dartemis/dartemis.dart';

@CustomTag('praxis-debug')
class PraxisDebugElement extends PolymerElement {

  World world;

  @observable int terrianOffsetXPx, terrianOffsetYPx;
  @observable int topLeftCellX, topLeftCellY;
  @observable int bottomRightCellX, bottomRightCellY;

  PraxisDebugElement.created() : super.created();
}