library response;

import 'dart:convert';
import 'mixins/grid.dart';

part 'response/terrian.dart';
part 'response/decoration.dart';

abstract class Response extends Object with Grid {

  String response; // original data recieved
  List<List> data; // json parsed

  Response(this.response) {
    data = JSON.decode(response);
  }

}
