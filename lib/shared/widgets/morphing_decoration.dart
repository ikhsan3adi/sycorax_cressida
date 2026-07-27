import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:material_new_shapes/material_new_shapes.dart';
import 'package:sycorax_cressida/shared/paintings/morphing_shape_border.dart';

class MorphingDecoration extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;

  const MorphingDecoration({
    super.key,
    this.child,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          MorphingShapeDecoration(
            colorModifier: (color) => color.withAlpha(127),
            turnModifier: 1,
            randomDurationRangeMs: (1000, 3500),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MorphingShapeDecoration(
              colorModifier: (color) => color.withAlpha(223),
              turnModifier: 1.8,
              randomDurationRangeMs: (2000, 6500),
            ),
          ),

          ?child,
        ],
      ),
    );
  }
}

class MorphingShapeDecoration extends StatefulWidget {
  final double turnModifier;
  final (int, int) randomDurationRangeMs;
  final Color Function(Color color)? colorModifier;

  const MorphingShapeDecoration({
    super.key,
    this.turnModifier = 1.0,
    this.randomDurationRangeMs = (1000, 3500),
    this.colorModifier,
  });

  @override
  State<MorphingShapeDecoration> createState() =>
      _MorphingShapeDecorationState();
}

class _MorphingShapeDecorationState extends State<MorphingShapeDecoration> {
  final Random _random = Random();

  double _currentTurns = 0.0;
  Duration _rotationDuration = const Duration(seconds: 2);

  late RoundedPolygon _currentShape;

  int _currentColorIndex = 0;

  final List<RoundedPolygon> _shapes =
      MaterialShapes.all.map((shape) => shape.normalized()).toList()..shuffle();

  @override
  void initState() {
    super.initState();

    _currentShape = _shapes.first;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _randomizeDecoration();
    });
  }

  void _randomizeDecoration() async {
    if (!mounted) return;
    await Future.delayed(const Duration(milliseconds: 100));

    setState(() {
      _currentShape = _shapes[_random.nextInt(_shapes.length)];
      _currentColorIndex = _random.nextInt(8);

      final double turnAmount =
          _random.nextDouble() * widget.turnModifier + 0.2;
      _currentTurns += _random.nextBool() ? turnAmount : -turnAmount;

      final int randomMilliseconds =
          widget.randomDurationRangeMs.$1 +
          _random.nextInt(
            widget.randomDurationRangeMs.$2 - widget.randomDurationRangeMs.$1,
          );
      _rotationDuration = Duration(milliseconds: randomMilliseconds);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
      theme.colorScheme.inversePrimary,
      theme.colorScheme.error,
      theme.colorScheme.primaryContainer,
      theme.colorScheme.secondaryContainer,
      theme.colorScheme.tertiaryContainer,
    ];
    return AnimatedRotation(
      turns: _currentTurns,
      duration: _rotationDuration,
      curve: Curves.easeInOutCubic,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: _rotationDuration,
        curve: Curves.easeInOutSine,
        onEnd: _randomizeDecoration,
        width: double.infinity,
        height: double.infinity,
        decoration: ShapeDecoration(
          color: widget.colorModifier != null
              ? widget.colorModifier!(colors[_currentColorIndex])
              : colors[_currentColorIndex],
          shape: MorphingShapeBorder(polygon: _currentShape),
        ),
      ),
    );
  }
}
