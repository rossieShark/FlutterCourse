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
    return width * 1.35;
  } else {
    return width * 1.4;
  }
}

// class ResponsiveBuilder<T> extends StatelessWidget {
//   final Widget Function(BuildContext, Widget?, T) builder;
//   final Widget? child;
//   final T narrow;
//   final T large;
//   final T medium;
//   const ResponsiveBuilder({
//     required this.builder,
//     required this.narrow,
//     required this.large,
//     required this.medium,
//     this.child,
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constr) {
//       if (constr.maxWidth <= ScreenSizes.medium) {
//         return builder(context, child, narrow);
//       }
//       if (constr.maxWidth <= ScreenSizes.medium) {
//         return builder(context, child, medium);
//       }
//       return builder(context, child, large);
//     });
//   }
// }
