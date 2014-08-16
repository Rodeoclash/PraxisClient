library request;

import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'response.dart' as Response;
import 'dart:convert';

part 'request/terrian.dart';
part 'request/decoration.dart';

abstract class Request {
  String url;

  Request(this.url) {

  }

  Future _perform() {
    return HttpRequest.getString(url);
  }

}
