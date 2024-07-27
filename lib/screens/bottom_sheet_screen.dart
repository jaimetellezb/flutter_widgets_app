import 'package:flutter/material.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet Screen'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetModal(),
            BottomSheetModal2(),
            BottomSheetModal3()
          ],
        ),
      ),
    );
  }
}

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined),
                      ),
                      const Text('Compartir')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                      ),
                      const Text('Eliminar')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_note_outlined),
                      ),
                      const Text('Editar')
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Text('Mostrar BottomSheet con íconos'),
    );
  }
}

class BottomSheetModal2 extends StatelessWidget {
  const BottomSheetModal2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            showDragHandle: true,
            builder: (context) {
              return SizedBox(
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                          'Mostramos información permanente sobre un BottomSheet.'
                          'Puede seguir interactuando con la pantalla.'),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: const Text('Mostrar BottomSheet Estándar'),
    );
  }
}

class BottomSheetModal3 extends StatelessWidget {
  const BottomSheetModal3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          showDragHandle: true,
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text('Tendencia')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text('Prioridad')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text('Más vistos')
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.download_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Text('Mostrar BottomSheet con división'),
    );
  }
}
