import 'package:flutter/material.dart';

class ScreenSizes {
  static const narrow = 480;
  static const medium = 600;
  static const large = 1280;
}

double getResponsiveSize(double maxWidth, double width) {
  if (maxWidth < ScreenSizes.medium) {
    return width;
  }
  if (ScreenSizes.large > maxWidth && maxWidth >= ScreenSizes.medium) {
    return width * 1.3;
  } else {
    return width * 1.3;
  }
}

class ResponsiveBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext, Widget?, T) builder;
  final Widget? child;
  final T narrow;
  final T large;
  final T medium;

  const ResponsiveBuilder({
    required this.builder,
    required this.narrow,
    required this.large,
    required this.medium,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constr) {
      double screenHeight = MediaQuery.of(context).size.width;

      if (screenHeight < ScreenSizes.medium) {
        return builder(context, child, narrow);
      }
      if (screenHeight >= ScreenSizes.medium &&
          screenHeight < ScreenSizes.large) {
        return builder(context, child, medium);
      }
      return builder(context, child, large);
    });
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext) narrow;
  final Widget Function(BuildContext) medium;
  final Widget Function(BuildContext) large;
  const ResponsiveWidget({
    super.key,
    required this.narrow,
    required this.medium,
    required this.large,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constr) {
      if (constr.maxWidth <= ScreenSizes.medium) {
        return narrow(context);
      }
      if (constr.maxWidth <= ScreenSizes.large) {
        return medium(context);
      }
      return large(context);
    });
  }
}

class ResponsiveButton {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? color;
  ResponsiveButton({
    required this.iconData,
    this.color,
    required this.onPressed,
  });
}
