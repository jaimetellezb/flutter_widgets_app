import 'package:flutter/material.dart';

class FloatingButtonScreen extends StatefulWidget {
  const FloatingButtonScreen({super.key});

  @override
  State<FloatingButtonScreen> createState() => _FloatingButtonScreenState();
}

class _FloatingButtonScreenState extends State<FloatingButtonScreen> {
  String text = '';
  ShapeBorder? shape;
  Color? color;

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Buttons Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'btn1',
                    foregroundColor: colorScheme.onSecondary,
                    backgroundColor: colorScheme.secondary,
                    child: const Icon(Icons.play_arrow_rounded),
                    onPressed: () => setState(() {
                      text = text == 'Small' ? '' : 'Small';
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Small'),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'btn2',
                    foregroundColor: colorScheme.onTertiaryContainer,
                    backgroundColor: colorScheme.tertiaryContainer,
                    child: const Icon(Icons.add),
                    onPressed: () => setState(() {
                      text = text == 'Normal' ? '' : 'Normal';
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Normal'),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton.extended(
                    heroTag: 'btn3',
                    icon: const Icon(Icons.pause_rounded),
                    label: const Text('Pause'),
                    onPressed: () => setState(() {
                      text = text == 'Extended' ? '' : 'Extended';
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Extended'),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton.large(
                    heroTag: 'btn4',
                    foregroundColor: colorScheme.surface,
                    backgroundColor: colorScheme.primary,
                    child: const Icon(Icons.stop_rounded),
                    onPressed: () => setState(() {
                      text = text == 'Large' ? '' : 'Large';
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Large'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          if (text.isNotEmpty)
            Center(
              child: Text(
                '$text button',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          if (enabled)
            FloatingActionButton.large(
              heroTag: 'btn5',
              backgroundColor: colorScheme.tertiaryContainer,
              onPressed: () {},
              child: const Text('Enabled'),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        shape: shape,
        onPressed: () {
          setState(() {
            enabled = !enabled;
            shape = shape.runtimeType == const StadiumBorder().runtimeType
                ? null
                : const StadiumBorder();
            color = color == colorScheme.tertiaryContainer
                ? colorScheme.inversePrimary
                : colorScheme.tertiaryContainer;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
