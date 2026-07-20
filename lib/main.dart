import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BreathingButton()));
}

class BreathingButton extends StatefulWidget {
  const BreathingButton({super.key});

  @override
  State<BreathingButton> createState() => _BreathingButtonState();
}

class _BreathingButtonState extends State<BreathingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    scale = Tween<double>(begin: 0.9, end: 1.08).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: ScaleTransition(
          scale: scale,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Start"),
          ),
        ),
      ),
    );
  }
}