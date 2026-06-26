import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RotatingIcon()));
}

class RotatingIcon extends StatefulWidget {
  const RotatingIcon({super.key});

  @override
  State<RotatingIcon> createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RotationTransition(
          turns: controller,
          child: const Icon(
            Icons.settings,
            size: 90,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}