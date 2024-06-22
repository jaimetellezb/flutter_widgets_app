import 'package:flutter/material.dart';

class ProgressIndicatorScreen extends StatefulWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  State<ProgressIndicatorScreen> createState() =>
      _ProgressIndicatorScreenState();
}

class _ProgressIndicatorScreenState extends State<ProgressIndicatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator Screen'),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          LinearProgressWidget(),
          SizedBox(
            height: 20,
          ),
          CircularProgressWidget()
        ],
      ),
    );
  }
}

class LinearProgressWidget extends StatefulWidget {
  const LinearProgressWidget({
    super.key,
  });

  @override
  State<LinearProgressWidget> createState() => _LinearProgressWidgetState();
}

class _LinearProgressWidgetState extends State<LinearProgressWidget> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indicador de progreso lineal',
            style: textStyle.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          const LinearProgressIndicator(
            minHeight: 20,
            backgroundColor: Colors.amber,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LinearProgressIndicator(
                minHeight: 20,
                backgroundColor: Colors.amber,
                value: value,
              ),
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    value += 0.1;
                  });
                  if (value >= 1) value = 0.0;
                },
                label: const Text('Incrementar'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularProgressWidget extends StatefulWidget {
  const CircularProgressWidget({
    super.key,
  });

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget>
    with TickerProviderStateMixin {
  double value = 0.0;

  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indicador de progreso circular',
            style: textStyle.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.amber,
                color: Colors.red,
                value: controller.value,
                valueColor: const AlwaysStoppedAnimation(Colors.pink),
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.amber,
                value: value,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    controller.repeat(reverse: true);
                  });
                },
                label: const Text('Repetir'),
                icon: const Icon(Icons.update),
              ),
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    value += 0.1;
                  });
                  if (value >= 1) value = 0.0;
                },
                label: const Text('Incrementar'),
                icon: const Icon(Icons.update),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
