import 'package:flutter/material.dart';

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          showAlertDialogBasic(context),
          showSimpleDialogBasic(context),
          removeAlertDialog(context),
          const AlertDialogOptions(),
        ],
      ),
    );
  }

  FilledButton showSimpleDialogBasic(BuildContext context) {
    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('SimpleDialog básico'),
              children: [
                SimpleDialogOption(
                  onPressed: () {},
                  child: const Text('Opción 1'),
                ),
                SimpleDialogOption(
                  onPressed: () {},
                  child: const Text('Opción 2'),
                )
              ],
            );
          },
        );
      },
      child: const Text('Ver SimpleDialog'),
    );
  }

  ElevatedButton showAlertDialogBasic(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('AlertDialog básico'),
              content: const Text(
                'Podemos colocar información representativa\n'
                'para indicar al usuario\n'
                'cuál es el fin de las acciones\n'
                'que tiene para realizar.',
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Text('Ver AlertDialog'),
    );
  }

  removeAlertDialog(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: const Icon(Icons.delete),
              title: const Text('Eliminar archivo?'),
              content: const Text(
                'Se eliminará el archivo seleccionado\n'
                'de forma permanente.\n',
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Eliminar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Text('AlertDialog con ícono'),
    );
  }
}

class AlertDialogOptions extends StatefulWidget {
  const AlertDialogOptions({super.key});

  @override
  State<AlertDialogOptions> createState() => _AlertDialogOptionsState();
}

class _AlertDialogOptionsState extends State<AlertDialogOptions> {
  ColorOptions? option = ColorOptions.blue;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Seleccionar color'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Divider(),
                        RadioListTile<ColorOptions>(
                          tileColor: Colors.yellow,
                          value: ColorOptions.yellow,
                          groupValue: option,
                          title: const Text('Amarrillo'),
                          onChanged: (ColorOptions? value) {
                            setState(() {
                              option = value;
                            });
                          },
                        ),
                        RadioListTile<ColorOptions>(
                          tileColor: Colors.blue,
                          value: ColorOptions.blue,
                          groupValue: option,
                          title: const Text('Azul'),
                          onChanged: (ColorOptions? value) {
                            setState(() {
                              option = value;
                            });
                          },
                        ),
                        RadioListTile<ColorOptions>(
                          tileColor: Colors.red,
                          value: ColorOptions.red,
                          groupValue: option,
                          title: const Text('Rojo'),
                          onChanged: (ColorOptions? value) {
                            setState(() {
                              option = value;
                            });
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Aceptar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: const Text('AlertDialog con ícono'),
    );
  }
}

enum ColorOptions { yellow, blue, red }
