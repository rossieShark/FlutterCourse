// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

import 'package:js/js.dart';

@JS()
external Future<int> getBatteryLevel();

Future<int> getWebBatteryLevel() async {
  final int result = await promiseToFuture(getBatteryLevel());
  return result;
}
