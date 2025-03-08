import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/configs/widget_category.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Widgets'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 80,
        ),
        itemBuilder: (context, index) {
          final category = categoryList[index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: FilledButton.icon(
              style: const ButtonStyle(
                shape: WidgetStatePropertyAll(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                context.go('/${category.path}');
              },
              icon: Icon(category.icon),
              label: Align(
                  alignment: Alignment.centerLeft, child: Text(category.title)),
            ),
          );
        },
      ),
    );
  }
}
