import 'package:flutter/material.dart';
import 'package:material_new_shapes/material_new_shapes.dart';

class MorphingShapeBorder extends OutlinedBorder {
  final RoundedPolygon polygon;
  final Morph? morph;
  final double progress;

  const MorphingShapeBorder({
    required this.polygon,
    this.morph,
    this.progress = 0.0,
    super.side = BorderSide.none,
  });

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return MorphingShapeBorder(
      polygon: polygon,
      morph: morph,
      progress: progress,
      side: side ?? this.side,
    );
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is MorphingShapeBorder) {
      return MorphingShapeBorder(
        polygon: b.polygon,
        morph: Morph(polygon, b.polygon),
        progress: t,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MorphingShapeBorder) {
      return MorphingShapeBorder(
        polygon: polygon,
        morph: Morph(a.polygon, polygon),
        progress: t,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = morph != null
        ? morph!.toPath(progress: progress)
        : polygon.toPath();

    final bounds = path.getBounds();
    final double scaleX = rect.width / bounds.width;
    final double scaleY = rect.height / bounds.height;

    final Matrix4 matrix = Matrix4.identity()
      ..translateByDouble(rect.center.dx, rect.center.dy, 0.0, 1.0)
      ..scaleByDouble(scaleX, scaleY, 1.0, 1.0)
      ..translateByDouble(-bounds.center.dx, -bounds.center.dy, 0.0, 1.0);

    return path.transform(matrix.storage);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
