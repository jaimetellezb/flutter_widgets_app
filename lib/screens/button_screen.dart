import 'package:flutter/material.dart';

enum Sizes { small, medium, large }

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Sizes selection = Sizes.medium;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const ElevatedButton(
            onPressed: null, // el null deshabilita el botón
            child: Text('ElevatedButton deshabilitado'),
          ),
          ElevatedButton(
            onPressed: () => {
              print('ElevatedButton normal'),
            },
            child: const Text('ElevatedButton'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('ElevatedButton con ícono'),
          ),
          const FilledButton(
            onPressed: null,
            child: Text('FilledButton desabilitado'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('FilledButton normal'),
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('FilledButton con ícono'),
          ),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('FilledButton tonal'),
          ),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('FilledButton tonal icon'),
          ),
          const OutlinedButton(
            onPressed: null,
            child: Text('OutlinedButton deshabilitado'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton normal'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('OutlinedButton con ícono'),
          ),
          const TextButton(
            onPressed: null,
            child: Text('TextButton deshabilitado'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('TextButton normal'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('TextButton con ícono'),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.inversePrimary),
              iconColor: MaterialStatePropertyAll(colors.background),
            ),
          ),
          SegmentedButton(
            segments: const <ButtonSegment<Sizes>>[
              ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
              ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
              ButtonSegment<Sizes>(
                value: Sizes.large,
                label: Text('L'),
              ),
            ],
            selected: <Sizes>{selection},
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      persistentFooterButtons: [
        FloatingActionButton.extended(
          heroTag: 'hero1',
          onPressed: () {},
          label: const Text('Add'),
          icon: const Icon(Icons.add),
        ),
        FloatingActionButton.large(
          heroTag: 'hero2',
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: 'hero3',
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        FloatingActionButton.small(
          heroTag: 'hero4',
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
