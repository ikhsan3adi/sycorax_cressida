import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:material_new_shapes/material_new_shapes.dart';
import 'package:sycorax_cressida/shared/paintings/custom_path_shape_border.dart';

class MorphingDecoration extends StatefulWidget {
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
  State<MorphingDecoration> createState() => _MorphingDecorationState();
}

class _MorphingDecorationState extends State<MorphingDecoration> {
  late Timer _timer;
  late Timer _timer2;

  final Random _random = Random();

  double _currentTurns = 0.0;
  double _currentBgTurns = 0.0;
  Duration _rotationDuration = const Duration(seconds: 2);
  Duration _rotationBgDuration = const Duration(seconds: 3);

  late ShapeBorder _currentShape;
  late ShapeBorder _currentBgShape;

  int _currentColorIndex = 0;
  int _currentBgColorIndex = 0;

  final List<ShapeBorder> _shapes =
      MaterialShapes.all
          .map((shape) => CustomPathShapeBorder(rawPath: shape.toPath()))
          .toList()
        ..shuffle();

  @override
  void initState() {
    super.initState();

    _currentShape = _shapes.first;
    _currentBgShape = _shapes.last;

    _timer = Timer.periodic(_rotationDuration, (timer) {
      _randomizeDecoration1();
    });

    _timer2 = Timer.periodic(_rotationBgDuration, (timer) {
      _randomizeDecoration2();
    });
  }

  void _randomizeDecoration1() {
    setState(() {
      _currentShape = _shapes[_random.nextInt(_shapes.length)];
      _currentColorIndex = _random.nextInt(3);

      final double turnAmount = _random.nextDouble() + 0.2;
      _currentTurns += _random.nextBool() ? turnAmount : -turnAmount;

      final int randomMilliseconds = 1000 + _random.nextInt(2500);
      _rotationDuration = Duration(milliseconds: randomMilliseconds);
    });
  }

  void _randomizeDecoration2() {
    setState(() {
      _currentBgShape = _shapes[_random.nextInt(_shapes.length)];
      _currentBgColorIndex = _random.nextInt(3);

      final double turnAmount = _random.nextDouble() * 1.8 + 0.2;
      _currentBgTurns += _random.nextBool() ? turnAmount : -turnAmount;

      final int randomMilliseconds = 2000 + _random.nextInt(4500);
      _rotationBgDuration = Duration(milliseconds: randomMilliseconds);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer2.cancel();
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
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedRotation(
            turns: _currentBgTurns,
            duration: _rotationBgDuration,
            curve: Curves.easeInOutCubic,
            child: AnimatedContainer(
              duration: _rotationBgDuration,
              curve: Curves.easeOutSine,
              width: double.infinity,
              height: double.infinity,
              decoration: ShapeDecoration(
                color: colors[_currentBgColorIndex].withAlpha(128),
                shape: _currentBgShape,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedRotation(
              turns: _currentTurns,
              duration: _rotationDuration,
              curve: Curves.easeInOutCubic,
              child: AnimatedContainer(
                duration: _rotationDuration,
                curve: Curves.easeOutSine,
                width: double.infinity,
                height: double.infinity,
                decoration: ShapeDecoration(
                  color: colors[_currentColorIndex].withAlpha(223),
                  shape: _currentShape,
                ),
              ),
            ),
          ),

          if (widget.child != null) widget.child!,
        ],
      ),
    );
  }
}
