import 'dart:math';

import 'package:flutter/foundation.dart';

class CalculatorBrain {
  int weight;
  int height;
  CalculatorBrain({ @required this.weight, @required this.height }){
    bmi = weight/pow(height/100, 2);
  }

  double bmi ;
  String calcilateBMI() {
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(bmi < 18.5) {
      return 'underweight';
    } else if(bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if(bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else if(bmi >= 30 && bmi < 35) {
      return 'Obese Class I (Moderately obese)';
    } else if(bmi >= 35 && bmi < 40) {
      return 'Obese Class II (Severely obese)';
    } else if(bmi >= 40 && bmi < 45) {
      return ' Obese Class III (Very severely obese)';
    } else if(bmi >= 45 && bmi < 50) {
      return ' Obese Class IV (Morbidly Obese)';
    } else if(bmi >= 50 && bmi < 60) {
      return ' Obese Class V (Super Obese)';
    } else if(bmi >= 60) {
      return ' Obese Class VI (Hyper Obese)';
    }
    return  '';
  }

  String getInterpretation() {
    if(bmi < 18.5) {
      return 'You have a lower than normal body weight, you can eat a bit more.';
    } else if(bmi >= 18.5 && bmi < 25) {
      return 'You have a normal body weight, good job';
    } else if(bmi >= 25) {
      return 'You have a higher than normal body weight, you have to do exercise more';
    } 
    return '';
  }
}