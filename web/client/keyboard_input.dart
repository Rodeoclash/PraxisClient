library keyboard_input;

import 'display.dart';
import 'dart:html';

class KeyboardInput {

  Display display;
  Map keyDown;

  KeyboardInput(this.display) {
    document.body.onKeyDown.listen(_onKeyDown);
    document.body.onKeyUp.listen(_onKeyUp);
    display.renderLoop.listen((_) => _render());
    keyDown = {};
  }

  void _render() {
    if (_isPressing(87) == true) { // w
      display.scroll.up();
    }
    if (_isPressing(83) == true) { // s
      display.scroll.down();
    }
    if (_isPressing(68) == true) { // d
      display.scroll.right();
    }
    if (_isPressing(65) == true) { // a
      display.scroll.left();
    }
  }

  void _onKeyDown(KeyboardEvent e) {
    keyDown[e.keyCode] = true;
  }

  void _onKeyUp(KeyboardEvent e) {
    keyDown[e.keyCode] = false;
  }

  bool _isPressing(num keyCode) {
    return keyDown[keyCode] == true;
  }

}