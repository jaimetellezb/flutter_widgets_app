import 'package:flutter/material.dart' show Icons, IconData;
import 'package:flutter_widgets_app/configs/configs.dart';

class WidgetCategory {
  final String title;
  final String path;
  final IconData icon;

  const WidgetCategory({
    required this.title,
    required this.path,
    required this.icon,
  });
}

final categoryList = <WidgetCategory>[
  WidgetCategory(
    title: RouteProperties.buttonScreen.label,
    path: RouteProperties.buttonScreen.path,
    icon: Icons.smart_button_outlined,
  ),
  WidgetCategory(
    title: RouteProperties.floatingButtonScreen.label,
    path: RouteProperties.floatingButtonScreen.path,
    icon: Icons.play_arrow_outlined,
  ),
  WidgetCategory(
    title: RouteProperties.iconButtonScreen.label,
    path: RouteProperties.iconButtonScreen.path,
    icon: Icons.arrow_circle_right_outlined,
  ),
  WidgetCategory(
    title: RouteProperties.segmentedButtonScreen.label,
    path: RouteProperties.segmentedButtonScreen.path,
    icon: Icons.arrow_circle_right_outlined,
  ),
];
