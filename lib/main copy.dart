import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/configs/configs.dart';

void main() {
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().theme(),
      routerConfig: appRouter,
    );
  }
}
