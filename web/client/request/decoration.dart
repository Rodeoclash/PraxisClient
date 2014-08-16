part of request;

class Decoration extends Request {

  static final FAKE_DATA_WIDTH = 64;
  static final FAKE_DATA_HEIGHT = 64;

  Decoration(String url) : super(url);

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
           var offsetX = rng.nextInt(FAKE_DATA_WIDTH);
           var offsetY = rng.nextInt(8);
           data[r][c] = {
             "imagePath": "images/tiles/decorations/$tile.png",
             "offset": [offsetX, offsetY]
           };
         }
       }

       return new Response.Decoration(JSON.encode(data));
     });

  }

}
