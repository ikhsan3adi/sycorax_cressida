import 'package:flutter/material.dart';
import 'package:material_new_shapes/material_new_shapes.dart';

@Deprecated('Currently unused')
class M3eShapeClipper extends CustomClipper<Path> {
  M3eShapeClipper({required this.shape});

  final RoundedPolygon shape;

  @override
  Path getClip(Size size) {
    final Path rawPath = shape.toPath();

    final Rect bounds = rawPath.getBounds();

    final double scaleX = size.width / bounds.width;
    final double scaleY = size.height / bounds.height;

    final Matrix4 matrix = Matrix4.identity()
      ..scaleByDouble(scaleX, scaleY, 1.0, 1.0)
      ..translateByDouble(-bounds.left, -bounds.top, 0.0, 1.0);

    return rawPath.transform(matrix.storage);
  }

  @override
  bool shouldReclip(covariant M3eShapeClipper oldClipper) {
    return shape != oldClipper.shape;
  }
}
