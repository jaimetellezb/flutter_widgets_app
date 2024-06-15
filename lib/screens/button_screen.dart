import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/widgets/widgets.dart';

enum Sizes { small, medium, large }

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
