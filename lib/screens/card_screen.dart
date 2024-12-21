import 'package:flutter/material.dart';

/// Clase Screen para widget card
class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Card(
              color: Colors.amber,
              shadowColor: Colors.red,
              surfaceTintColor: Colors.red,
              elevation: 20,
              shape: BeveledRectangleBorder(),
              margin: EdgeInsets.all(30),
              child: SizedBox(
                width: 300,
                height: 100,
                child: Center(
                  child: Text("Card con elevación y bordes cuadrados"),
                ),
              ),
            ),
            const Spacer(),
            const Card.filled(
              color: Colors.green,
              child: SizedBox(
                width: 350,
                height: 150,
                child: Center(
                  child: Text("Card con relleno"),
                ),
              ),
            ),
            const Spacer(),
            const Card.outlined(
              color: Colors.white,
              child: SizedBox(
                width: 300,
                height: 100,
                child: Center(
                  child: Text("Card con borde en línea"),
                ),
              ),
            ),
            const Spacer(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dolore consequat incididunt aliquip sint Lorem occaecat velit incididunt ullamco fugiat magna nulla voluptate.",
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Cancel"),
                        ),
                        FilledButton(
                          onPressed: () {},
                          child: const Text("Aceptar"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
