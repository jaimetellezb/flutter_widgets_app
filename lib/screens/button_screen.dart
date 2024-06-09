import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/widgets/widgets.dart';

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
        children: const [
          ElevatedButtons(),
          SizedBox(
            height: 20,
          ),
          FilledButtons(),
          SizedBox(
            height: 20,
          ),
          FilledTonalButtons(),
          SizedBox(
            height: 20,
          ),
          OutlinedButtons(),
          SizedBox(
            height: 20,
          ),
          TextButtons(),
          /*
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.inversePrimary),
              iconColor: WidgetStatePropertyAll(colors.surface),
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
          )*/
        ],
      ),
      // persistentFooterButtons: [
      //   FloatingActionButton.extended(
      //     heroTag: 'hero1',
      //     onPressed: () {},
      //     label: const Text('Add'),
      //     icon: const Icon(Icons.add),
      //   ),
      //   FloatingActionButton.large(
      //     heroTag: 'hero2',
      //     onPressed: () {},
      //     child: const Icon(Icons.add),
      //   ),
      //   FloatingActionButton(
      //     heroTag: 'hero3',
      //     onPressed: () {},
      //     child: const Icon(Icons.add),
      //   ),
      //   FloatingActionButton.small(
      //     heroTag: 'hero4',
      //     onPressed: () {},
      //     child: const Icon(Icons.add),
      //   ),
      // ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
