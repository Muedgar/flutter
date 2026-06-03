import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ModernFlipClock(),
  ));
}

class ModernFlipClock extends StatefulWidget {
  const ModernFlipClock({super.key});

  @override
  State<ModernFlipClock> createState() => _ModernFlipClockState();
}

class _ModernFlipClockState extends State<ModernFlipClock> {
  late Timer timer;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String twoDigits(int value) => value.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = twoDigits(now.hour);
    final minutes = twoDigits(now.minute);
    final seconds = twoDigits(now.second);

    return Scaffold(
      backgroundColor: const Color(0xff09090b),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xff18181b),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 30,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlipNumber(value: hours),
              const TimeSeparator(),
              FlipNumber(value: minutes),
              const TimeSeparator(),
              FlipNumber(value: seconds),
            ],
          ),
        ),
      ),
    );
  }
}

class FlipNumber extends StatelessWidget {
  final String value;

  const FlipNumber({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlipDigit(value: value[0]),
        const SizedBox(width: 8),
        FlipDigit(value: value[1]),
      ],
    );
  }
}

class FlipDigit extends StatefulWidget {
  final String value;

  const FlipDigit({
    super.key,
    required this.value,
  });

  @override
  State<FlipDigit> createState() => _FlipDigitState();
}

class _FlipDigitState extends State<FlipDigit>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late String oldValue;
  late String newValue;

  @override
  void initState() {
    super.initState();

    oldValue = widget.value;
    newValue = widget.value;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didUpdateWidget(covariant FlipDigit oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      oldValue = oldWidget.value;
      newValue = widget.value;

      controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget digitBox(String text) {
    return Container(
      width: 58,
      height: 82,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff27272a),
            Color(0xff111113),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xff3f3f46)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 44,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final angle = controller.value * pi;

        final isHalfway = controller.value >= 0.5;
        final text = isHalfway ? newValue : oldValue;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0018)
            ..rotateX(angle),
          child: digitBox(text),
        );
      },
    );
  }
}

class TimeSeparator extends StatelessWidget {
  const TimeSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        ':',
        style: TextStyle(
          fontSize: 46,
          color: Color(0xffa1a1aa),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}