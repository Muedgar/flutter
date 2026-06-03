import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: FlipExample(),
    ),
  );
}

class FlipExample extends StatefulWidget {
  const FlipExample({super.key});

  @override
  State<FlipExample> createState() => _FlipExampleState();
}

class _FlipExampleState extends State<FlipExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool showingZero = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  void flip() async {
    await controller.forward();

    setState(() {
      showingZero = !showingZero;
    });

    controller.reset();
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
        child: GestureDetector(
          onTap: flip,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              final angle = controller.value * pi;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(angle),
                child: Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      showingZero ? '0' : '1',
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}