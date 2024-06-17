import 'package:flutter/material.dart';

class IconButtonScreen extends StatefulWidget {
  const IconButtonScreen({super.key});

  @override
  State<IconButtonScreen> createState() => _IconButtonScreenState();
}

class _IconButtonScreenState extends State<IconButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Button Screen'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.pink,
              ))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.green,
                          size: 36.0,
                        ),
                        onPressed: () {},
                      ),
                      const IconButton(
                        tooltip: 'Botón deshabilitado',
                        icon: Icon(
                          Icons.highlight_remove_rounded,
                          color: Colors.grey,
                          size: 36.0,
                        ),
                        onPressed: null,
                      ),
                    ],
                  ),
                  const Text('Normal'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        icon: const Icon(Icons.volume_up_rounded),
                        onPressed: () {},
                      ),
                      const IconButton.filled(
                        icon: Icon(Icons.volume_off_rounded),
                        onPressed: null,
                      ),
                    ],
                  ),
                  const Text('Filled'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(
                        icon: const Icon(Icons.video_call_rounded),
                        onPressed: () {},
                      ),
                      const IconButton.filledTonal(
                        icon: Icon(Icons.videocam_off_sharp),
                        onPressed: null,
                      ),
                    ],
                  ),
                  const Text('FilledTonal'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.outlined(
                        icon: const Icon(Icons.mic_none_rounded),
                        onPressed: () {},
                      ),
                      const IconButton.outlined(
                        icon: Icon(Icons.mic_off),
                        onPressed: null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Outlined'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
