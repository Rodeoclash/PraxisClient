import 'client/request.dart' as Request;
import 'client/response.dart' as Response;
import 'client/layer.dart' as Layer;
import 'client/display.dart';
import 'client/keyboard_input.dart';

class Client {

  Client() {

    var display = new Display();
    var keyboardInput = new KeyboardInput(display);

    new Request.Terrian('data/terrian.json')
        .fakeGet()
        .then( (Response.Terrian response) {
          display.setTerrianLayer(new Layer.Terrian(response, display));
        });

    new Request.Decoration('data/decoration.json')
        .fakeGet()
        .then( (Response.Decoration response) {
          //display.addDecorationLayer(new Layer.Decoration(response));
        });

  }

}

void main() {
  new Client();
}