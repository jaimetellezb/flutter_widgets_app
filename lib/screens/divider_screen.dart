import 'package:flutter/material.dart';

/// Clase Screen para widget divider
class DividerScreen extends StatelessWidget {
  const DividerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Divider Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Column(
                  children: [
                    Text(
                        "Amet adipisicing quis qui laborum mollit tempor ipsum et. Fugiat do ea tempor ullamco eu. Proident ad est ex enim magna culpa fugiat."),
                    Divider(
                      color: Colors.red,
                    ),
                    SelectedColor()
                  ],
                ),
              ),
              const Divider(
                height: 20, // alto del widget
                thickness: 5, // ancho de la línea
                indent:
                    50, // espacio en blanco desde la izquierda hasta el divider
                endIndent:
                    50, // espacio en blanco desde la derecha hasta el divider
                color: Colors.black,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(color: Colors.amber),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 10,
                      indent: 10,
                      endIndent: 5,
                      color: Colors.black,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(color: Colors.green),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedColor extends StatefulWidget {
  const SelectedColor({super.key});

  @override
  State<SelectedColor> createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedColor> {
  ColorSegment selection = ColorSegment.blue;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const <ButtonSegment<ColorSegment>>[
        ButtonSegment<ColorSegment>(
          value: ColorSegment.yellow,
          label: Text(
            'Amarillo',
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        ButtonSegment<ColorSegment>(
            value: ColorSegment.blue,
            label: Text(
              'Azul',
              style: TextStyle(color: Colors.blue),
            )),
        ButtonSegment<ColorSegment>(
          value: ColorSegment.red,
          label: Text(
            'Rojo',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ButtonSegment<ColorSegment>(
          value: ColorSegment.green,
          label: Text(
            'Verde',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
      selected: <ColorSegment>{selection},
      onSelectionChanged: (Set<ColorSegment> newSelection) {
        setState(() {
          selection = newSelection.first;
        });
      },
    );
  }
}

enum ColorSegment { yellow, blue, red, green }
