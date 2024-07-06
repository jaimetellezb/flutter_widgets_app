import 'package:flutter/material.dart';

class SnackBarScreen extends StatefulWidget {
  const SnackBarScreen({super.key});

  @override
  State<SnackBarScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarScreen> {
  bool showAction = false;
  String message = 'Mensaje activado desde una acción de SnackBar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Barra de mensajes por defecto'),
                ),
              );
            },
            child: const Text('Ver Snackbar'),
          ),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mensaje que demora 2 segundos'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Ver Snackbar 2 segundos'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Barra de mensajes'),
                  action: SnackBarAction(
                      label: 'Imprimir',
                      onPressed: () {
                        setState(() {
                          showAction = !showAction;
                        });
                      }),
                ),
              );
            },
            child: const Text('Ver Snackbar con acción'),
          ),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mensaje con ícono de cierre'),
                  showCloseIcon: true,
                ),
              );
            },
            child: const Text('Ver Snackbar con ícono de cierre'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mensaje con color de fondo verde'),
                  showCloseIcon: true,
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Ver Snackbar color de fondo diferente'),
          ),
          const SizedBox(
            height: 20,
          ),
          if (showAction)
            Center(
              child: Text(
                message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
        ],
      ),
    );
  }
}
