enum RouteProperties {
  homeScreen(
    name: 'home-screen',
    path: '/',
    label: 'Inicio',
  ),
  buttonScreen(
    name: 'button-screen',
    path: 'buttons',
    label: 'Botones comunes',
  ),
  floatingButtonScreen(
    name: 'floating-button-screen',
    path: 'floating-buttons',
    label: 'Botones flotantes',
  ),
  iconButtonScreen(
    name: 'icon-button-screen',
    path: 'icon-button',
    label: 'Botón de ícono',
  ),
  segmentedButtonScreen(
    name: 'segmented-button-screen',
    path: 'segmented-button',
    label: 'Botón segmentado',
  ),
  progressIndicatorScreen(
    name: 'progress-indicator-screen',
    path: 'progress-indicator',
    label: 'Indicadores de progreso',
  ),
  badgeScreen(
    name: 'badge-screen',
    path: 'badge',
    label: 'Insignias',
  ),
  snackBarScreen(
    name: 'snackbar-screen',
    path: 'snackbar',
    label: 'SnackBars',
  ),
  bottomSheetScreen(
    name: 'bottom-sheet-screen',
    path: 'bottom-sheet',
    label: 'Bottom Sheets',
  ),
  alertDialogScreen(
    name: 'alert-dialog-screen',
    path: 'alert-dialog',
    label: 'Diálogos',
  ),

  cardScreen(
    name: 'card-screen',
    path: 'card',
    label: 'Card',
  ),
  dividerScreen(
    name: 'divider-screen',
    path: 'divider',
    label: 'Divider',
  ),
  listTileScreen(
    name: 'listTile-screen',
    path: 'listTile',
    label: 'Listtile',
  ),
  appBarScreen(
    name: 'app-bar-screen',
    path: 'app-bar',
    label: 'AppBar',
  ),
  //END
  ;

  final String name;
  final String path;
  final String label;

  // Constructor del enum
  const RouteProperties(
      {required this.name, required this.path, required this.label});
}
