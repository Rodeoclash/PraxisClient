part of request;

class Terrian extends Request {

  static final FAKE_DATA_WIDTH = 64;
  static final FAKE_DATA_HEIGHT = 64;

  Terrian(String url) : super(url);

  Future get() {
    var completer = new Completer();
    super._perform().then((response) {
      completer.complete(new Response.Terrian(response));
    });
    return completer.future;
  }

  Future fakeGet() {
     return new Future.delayed(const Duration(seconds:1), () {
       var rng = new Random(1);
       var data = new List(FAKE_DATA_HEIGHT);

       // stub array out
       for (var i=0; i < data.length; i++) {
         data[i] = new List(FAKE_DATA_WIDTH);
       }

       // populate with random values
       for (var r=0; r < data.length; r++) {
         for (var c=0; c < data[r].length; c++) {
           var tile = rng.nextInt(2);
           var offsetY = rng.nextInt(7);;
           data[r][c] = {
             "imagePath": "images/tiles/terrian/$tile.png",
             "offset": [0, offsetY * -1]
           };
         }
       }

       return new Response.Terrian(JSON.encode(data));
     });

  }

}
