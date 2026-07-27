import 'package:flutter/material.dart';
import 'package:sycorax_cressida/core/theme.dart';
import 'package:sycorax_cressida/shared/widgets/morphing_decoration.dart';

void main() {
  runApp(const MorphTestApp());
}

class MorphTestApp extends StatelessWidget {
  const MorphTestApp({super.key});
  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(
      createTextTheme(context, 'Roboto', 'Roboto'),
    );
    return MaterialApp(home: const MorphTestPage(), theme: theme.light());
  }
}

class MorphTestPage extends StatelessWidget {
  const MorphTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Morph Test')),
      body: const Center(child: MorphingDecoration()),
    );
  }
}
