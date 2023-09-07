import 'package:batterylevel/main.dart';
import 'package:batterylevel/my_interop/web_interop.dart';
import 'package:flutter/material.dart';

class MyWebPage extends StatefulWidget {
  const MyWebPage({super.key});

  @override
  State<MyWebPage> createState() => _MyWebPageState();
}

class _MyWebPageState extends State<MyWebPage> {
  var _batteryLevel = 'Unknown battery level.';
  late DateTime _lastUpdateTime;

  @override
  void initState() {
    super.initState();
    _lastUpdateTime = DateTime.now();
    _getWebBatteryLevel();
  }

  Future<void> _getbatteryWebWithTimer() async {
    if (DateTime.now().difference(_lastUpdateTime).inSeconds >= 10) {
      _getWebBatteryLevel();
      _lastUpdateTime = DateTime.now();
    }
  }

  void _getWebBatteryLevel() async {
    final batteryLevel = await getWebBatteryLevel();
    setState(() {
      _batteryLevel = '$batteryLevel%';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BatteryLevelContent(
        onPressed: () {
          _getbatteryWebWithTimer();
        },
        batteryLevel: _batteryLevel);
  }
}
