import 'package:flutter/material.dart';

class DestinationData extends NavigationRailDestination {
  final Widget widget;
  final String labelText;

  DestinationData(this.widget, this.labelText)
      : super(
          icon: widget,
          label: Text(labelText),
        );
}
