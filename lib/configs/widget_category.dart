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
  WidgetCategory(
    title: RouteProperties.progressIndicatorScreen.label,
    path: RouteProperties.progressIndicatorScreen.path,
    icon: Icons.refresh_outlined,
  ),
  WidgetCategory(
    title: RouteProperties.badgeScreen.label,
    path: RouteProperties.badgeScreen.path,
    icon: Icons.notifications,
  ),
  WidgetCategory(
    title: RouteProperties.snackBarScreen.label,
    path: RouteProperties.snackBarScreen.path,
    icon: Icons.messenger_outline_outlined,
  ),
  WidgetCategory(
    title: RouteProperties.bottomSheetScreen.label,
    path: RouteProperties.bottomSheetScreen.path,
    icon: Icons.arrow_downward_outlined,
  ),
  WidgetCategory(
    title: RouteProperties.alertDialogScreen.label,
    path: RouteProperties.alertDialogScreen.path,
    icon: Icons.open_in_new_outlined,
  ),

  WidgetCategory(
    title: RouteProperties.cardScreen.label,
    path: RouteProperties.cardScreen.path,
    icon: Icons.card_giftcard,
  ),
  WidgetCategory(
    title: RouteProperties.dividerScreen.label,
    path: RouteProperties.dividerScreen.path,
    icon: Icons.remove,
  ),
  WidgetCategory(
    title: RouteProperties.listTileScreen.label,
    path: RouteProperties.listTileScreen.path,
    icon: Icons.width_normal,
  ),
  WidgetCategory(
    title: RouteProperties.appBarScreen.label,
    path: RouteProperties.appBarScreen.path,
    icon: Icons.toc_sharp,
  ),
  //END
];
