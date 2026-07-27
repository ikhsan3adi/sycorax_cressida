import 'package:flutter/material.dart';

@Deprecated('Use [MorphingShapeBorder] instead')
class CustomPathShapeBorder extends ShapeBorder {
  const CustomPathShapeBorder({required this.rawPath});

  Path pathBuilder(Rect rect) {
    final Rect bounds = rawPath.getBounds();

    final double scaleX = rect.width / bounds.width;
    final double scaleY = rect.height / bounds.height;

    final Matrix4 matrix = Matrix4.identity()
      ..translateByDouble(rect.center.dx, rect.center.dy, 0.0, 1.0)
      ..scaleByDouble(scaleX, scaleY, 1.0, 1.0)
      ..translateByDouble(-bounds.center.dx, -bounds.center.dy, 0.0, 1.0);

    return rawPath.transform(matrix.storage);
  }

  final Path rawPath;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return pathBuilder(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return pathBuilder(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
