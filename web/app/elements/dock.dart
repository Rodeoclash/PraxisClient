library dock;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:dartemis/dartemis.dart';
import '../systems.dart';

@CustomTag('praxis-dock')
class PraxisDockElement extends PolymerElement {

  World world;

  PraxisDockElement.created() : super.created();

  void toggleDebugging(Event e, var detail, Node target) {
    (world.getSystem(Debugging) as Debugging).toggle();
  }

  void toggleTerrianEditor(Event e, var detail, Node target) {
    (world.getSystem(TerrianEditor) as TerrianEditor).toggle();
  }

}