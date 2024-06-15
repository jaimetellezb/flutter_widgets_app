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
  );

  final String name;
  final String path;
  final String label;

  // Constructor del enum
  const RouteProperties(
      {required this.name, required this.path, required this.label});
}
