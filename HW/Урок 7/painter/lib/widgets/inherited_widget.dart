import 'package:flutter/material.dart';

import 'painter_widget.dart';

class PathsData extends InheritedWidget {
  final List<PathData> paths;
  final Function() onUndo;

  const PathsData({super.key, required this.paths, required this.onUndo, required Widget child})
      : super(child: child);

  static PathsData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PathsData>();
  }

  void undo() {
    onUndo();
  }

  @override
  bool updateShouldNotify(PathsData oldWidget) {
    return paths != oldWidget.paths;
  }
}
