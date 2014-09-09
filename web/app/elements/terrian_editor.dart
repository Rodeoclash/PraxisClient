library terrian_editor;

import 'package:polymer/polymer.dart';
import 'package:dartemis/dartemis.dart';

@CustomTag('praxis-terrian-editor')
class PraxisTerrianEditorElement extends PolymerElement {
  World world;
  PraxisTerrianEditorElement.created() : super.created();
}