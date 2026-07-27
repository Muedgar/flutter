

import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.lightYellow,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black
        )
      ),
      home: const CalculatorContainer() 
    );
  }
}

class CalculatorContainer extends StatelessWidget {
  const CalculatorContainer({super.key});

  @override 
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: false,
      child: SingleChildScrollView()
    );
  }
}


class AppColors {
  static const lightYellow = Color.fromARGB(57, 221, 225, 160);
  static const black = Color.fromARGB(105, 19, 20, 29);
  static const grey = Color.fromARGB(49, 129, 126, 125);
}
