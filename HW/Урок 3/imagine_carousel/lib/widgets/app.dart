import 'package:flutter/material.dart';
import 'package:imagine_carousel/widgets/imagine.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Imagine());
  }
}
