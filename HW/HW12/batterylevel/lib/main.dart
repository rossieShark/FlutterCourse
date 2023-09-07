import 'dart:async';

import 'package:batterylevel/platform/platfirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_interop/battery_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PlatformBuilder(
          web: const MyWebPage(),
          other: const MyHomePage(),
          builder: (context, child, widget) {
            return widget;
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  var _batteryLevel = 'Unknown battery level.';
  late DateTime _lastUpdateTime; // Track the last update time

  @override
  void initState() {
    super.initState();
    _lastUpdateTime = DateTime.now();
    _getBatteryLevel();
    // Initialize with current time
  }

  Future<void> _getbatteryWithTimer() async {
    if (DateTime.now().difference(_lastUpdateTime).inSeconds >= 10) {
      _getBatteryLevel();
      _lastUpdateTime = DateTime.now();
    }
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '$result';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BatteryLevelContent(
        batteryLevel: _batteryLevel,
        onPressed: () {
          _getbatteryWithTimer();
        });
  }
}

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
      _batteryLevel = '$batteryLevel';
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

class BatteryLevelContent extends StatelessWidget {
  const BatteryLevelContent({
    super.key,
    required this.onPressed,
    required String batteryLevel,
  }) : _batteryLevel = batteryLevel;

  final VoidCallback onPressed;
  final String _batteryLevel;

  double getParsedBatteryLevel(String str) {
    double parsedBatteryLevel = 0;
    try {
      parsedBatteryLevel = double.parse(_batteryLevel);
    } catch (e) {
      parsedBatteryLevel = 0;
    }
    return parsedBatteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Battery level',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                Container(
                  width: 102,
                  height: 42,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                ),
                Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                    height: 40,
                    width: getParsedBatteryLevel(_batteryLevel),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              _batteryLevel,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: onPressed,
        tooltip: 'Get Battery Level',
        child: const Icon(
          Icons.battery_full,
          color: Colors.white,
        ),
      ),
    );
  }
}
