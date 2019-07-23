import 'package:flutter/material.dart';

import 'package:bmi_calculator/screens/inputPage.dart';

import 'package:bmi_calculator/constances.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}


