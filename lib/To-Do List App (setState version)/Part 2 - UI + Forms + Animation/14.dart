import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExpandCard()));
}

class ExpandCard extends StatefulWidget {
  const ExpandCard({super.key});

  @override
  State<ExpandCard> createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            width: expanded ? 300 : 180,
            height: expanded ? 180 : 100,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: expanded ? Colors.deepPurple : Colors.indigo,
              borderRadius: BorderRadius.circular(expanded ? 28 : 18),
            ),
            child: const Center(
              child: Text(
                "Tap Me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}