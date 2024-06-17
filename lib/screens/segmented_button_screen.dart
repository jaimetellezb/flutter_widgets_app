import 'package:flutter/material.dart';

class SegmentedButtonScreen extends StatefulWidget {
  const SegmentedButtonScreen({super.key});

  @override
  State<SegmentedButtonScreen> createState() => _SegmentedButtonScreenState();
}

class _SegmentedButtonScreenState extends State<SegmentedButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmented Button Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Tallas',
            style: Theme.of(context).textTheme.titleMedium,
          )),
          const SingleSegmented(),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Categorías',
            style: Theme.of(context).textTheme.titleMedium,
          )),
          const SingleSegmentedCategory(),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Colores',
            style: Theme.of(context).textTheme.titleMedium,
          )),
          const MultipleSegmented(),
        ],
      ),
    );
  }
}

class SingleSegmented extends StatefulWidget {
  const SingleSegmented({super.key});

  @override
  State<SingleSegmented> createState() => _SingleSegmentedState();
}

class _SingleSegmentedState extends State<SingleSegmented> {
  Sizes selection = Sizes.medium;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text('L')),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: <Sizes>{selection},
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection.first;
        });
      },
    );
  }
}

class MultipleSegmented extends StatefulWidget {
  const MultipleSegmented({super.key});

  @override
  State<MultipleSegmented> createState() => _MultipleSegmentedState();
}

class _MultipleSegmentedState extends State<MultipleSegmented> {
  Set<Transport> selection = <Transport>{Transport.bicycle};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Transport>(
      segments: const <ButtonSegment<Transport>>[
        ButtonSegment<Transport>(
            value: Transport.bicycle,
            label: Text('Moto'),
            icon: Icon(Icons.motorcycle_rounded)),
        ButtonSegment<Transport>(
            value: Transport.car,
            label: Text('Carro'),
            icon: Icon(Icons.directions_car)),
        ButtonSegment<Transport>(
            value: Transport.bus,
            label: Text('Bus'),
            icon: Icon(Icons.directions_bus)),
        ButtonSegment<Transport>(
            value: Transport.airplane,
            label: Text('Avión'),
            icon: Icon(Icons.flight)),
      ],
      selected: selection,
      onSelectionChanged: (Set<Transport> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class SingleSegmentedCategory extends StatefulWidget {
  const SingleSegmentedCategory({super.key});

  @override
  State<SingleSegmentedCategory> createState() =>
      _SingleSegmentedCategoryState();
}

class _SingleSegmentedCategoryState extends State<SingleSegmentedCategory> {
  Sizes selection = Sizes.medium;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SegmentedButton(
      style: SegmentedButton.styleFrom(
        backgroundColor: colorScheme.tertiaryContainer,
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: colorScheme.tertiary,
      ),
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('Recientes')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('Más vistos')),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text('Populares')),
      ],
      selected: <Sizes>{selection},
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { small, medium, large, extraLarge }

enum Transport { bicycle, motorcycle, car, bus, airplane }
