import 'dart:async';

import 'package:chopper/chopper.dart';

class HeaderInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    request.headers['X-RapidAPI-Key'] =
        '13eeb99b4fmsha431d496ff5d969p19908cjsn5cf18e4e0ca1';
    request.headers['X-RapidAPI-Host'] = 'genius-song-lyrics1.p.rapidapi.com';
    return request;
  }
}
