import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/configs/configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
