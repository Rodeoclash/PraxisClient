library layer;

import 'mixins/grid.dart';
import 'dart:math';
import 'tile.dart';
import 'response.dart' as Response;
import 'coordinate.dart';
import 'display.dart';

part 'layer/terrian.dart';
part 'layer/decoration.dart';

abstract class Layer extends Object with Grid {

  List<List> data;
  Display display;

  Layer(response, this.display) {
    data = response.data;
  }

}