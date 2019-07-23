import 'package:flutter/material.dart';

import 'package:bmi_calculator/constances.dart';
import 'package:bmi_calculator/components/reusableCard.dart';
import'package:bmi_calculator/components/bottomButton.dart';

import'package:bmi_calculator/calculatorBrain.dart';

class ResultsPage extends StatelessWidget {
  final CalculatorBrain calculatorBrain;
  ResultsPage({ this.calculatorBrain });

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),

                  child: Text('Your Result',
                  style: kTitleTextStyle,
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: ReusableCard(
                  color: kactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('${calculatorBrain.getResult().toUpperCase()}',
                      style: kResultTextStyle,
                      ),

                      Text('${calculatorBrain.calcilateBMI()}',
                      style: kBMITextStyle,
                      ),

                      Text('${calculatorBrain.getInterpretation()}',
                      textAlign: TextAlign.center,
                      style: klabelTextStyle,
                      ),
                    ],
                  ),
                ),
              ),

              BottomButton(
                text: 'Re Calculate', 
                onPreesed: () => _onReCalculatePreesed(context)
              )
            ],
          ),
        )
      )
    );
  }
  
  void _onReCalculatePreesed(BuildContext context) {
    Navigator.of(context).pop();
  }
}