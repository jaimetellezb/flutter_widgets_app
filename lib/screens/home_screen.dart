import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/configs/configs.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets App'),
      ),
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final category = categoryList[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton.icon(
              onPressed: () {
                context.go(category.path);
              },
              icon: Icon(category.icon),
              label: Text(category.title),
            ),
          );
        },
      ),
    );
  }
}
