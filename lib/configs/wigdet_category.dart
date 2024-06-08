import 'package:flutter/material.dart' show Icons, IconData;

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

const categoryList = <WidgetCategory>[
  WidgetCategory(
    title: 'Botones',
    path: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
];
