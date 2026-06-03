import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pro Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = '0';
  String expression = '';
  double? firstNumber;
  String? operator;
  bool shouldResetDisplay = false;

  final List<List<String>> buttons = [
    ['C', '⌫', '%', '÷'],
    ['7', '8', '9', '×'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['±', '0', '.', '='],
  ];

  void onButtonTap(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
        expression = '';
        firstNumber = null;
        operator = null;
        shouldResetDisplay = false;
        return;
      }

      if (value == '⌫') {
        if (display.length > 1) {
          display = display.substring(0, display.length - 1);
        } else {
          display = '0';
        }
        return;
      }

      if (value == '±') {
        if (display != '0') {
          display = display.startsWith('-')
              ? display.substring(1)
              : '-$display';
        }
        return;
      }

      if (value == '%') {
        display = formatNumber(double.parse(display) / 100);
        return;
      }

      if (['+', '-', '×', '÷'].contains(value)) {
        firstNumber = double.tryParse(display);
        operator = value;
        expression = '$display $value';
        shouldResetDisplay = true;
        return;
      }

      if (value == '=') {
        calculateResult();
        return;
      }

      if (value == '.') {
        if (!display.contains('.')) {
          display += '.';
        }
        return;
      }

      if (shouldResetDisplay || display == '0') {
        display = value;
        shouldResetDisplay = false;
      } else {
        display += value;
      }
    });
  }

  void calculateResult() {
    if (firstNumber == null || operator == null) return;

    final secondNumber = double.tryParse(display);
    if (secondNumber == null) return;

    double result = 0;

    switch (operator) {
      case '+':
        result = firstNumber! + secondNumber;
        break;
      case '-':
        result = firstNumber! - secondNumber;
        break;
      case '×':
        result = firstNumber! * secondNumber;
        break;
      case '÷':
        if (secondNumber == 0) {
          display = 'Error';
          expression = '';
          firstNumber = null;
          operator = null;
          shouldResetDisplay = true;
          return;
        }
        result = firstNumber! / secondNumber;
        break;
    }

    expression = '${formatNumber(firstNumber!)} $operator ${formatNumber(secondNumber)}';
    display = formatNumber(result);
    firstNumber = null;
    operator = null;
    shouldResetDisplay = true;
  }

  String formatNumber(double number) {
    if (number % 1 == 0) {
      return number.toInt().toString();
    }

    return number.toStringAsFixed(8).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
  }

  bool isOperator(String value) {
    return ['+', '-', '×', '÷', '='].contains(value);
  }

  bool isUtility(String value) {
    return ['C', '⌫', '%'].contains(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111318),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff252936),
                        Color(0xff171922),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        expression,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.45),
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 12),
                      FittedBox(
                        child: Text(
                          display,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 68,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: buttons.map((row) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                      children: row.map((text) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: CalculatorButton(
                              text: text,
                              isOperator: isOperator(text),
                              isUtility: isUtility(text),
                              onTap: () => onButtonTap(text),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final bool isOperator;
  final bool isUtility;
  final VoidCallback onTap;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.isOperator,
    required this.isUtility,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xff242833);
    Color textColor = Colors.white;

    if (isOperator) {
      backgroundColor = const Color(0xff7c4dff);
    }

    if (isUtility) {
      backgroundColor = const Color(0xff343a46);
      textColor = const Color(0xffb8c0d4);
    }

    if (text == 'C') {
      textColor = const Color(0xffff6b6b);
    }

    return SizedBox(
      height: 72,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}