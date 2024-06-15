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
      body: GridView.builder(
        itemCount: categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          final category = categoryList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
              label: Text(category.title),
            ),
          );
        },
      ),

      // ListView.builder(
      //   itemCount: categoryList.length,
      //   itemBuilder: (context, index) {
      //     final category = categoryList[index];

      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: FilledButton.icon(
      //         onPressed: () {
      //           context.go('/${category.path}');
      //         },
      //         icon: Icon(category.icon),
      //         label: Text(category.title),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
