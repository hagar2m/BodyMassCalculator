import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/reusableCard.dart';
import 'package:bmi_calculator/components/iconContent.dart';
import 'package:bmi_calculator/constances.dart';
import 'package:bmi_calculator/components/bottomButton.dart';

import 'package:bmi_calculator/screens/resultsPage.dart';
import'package:bmi_calculator/calculatorBrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightValue = 150;
  int weight = 90;
  int age = 30;

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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _genderPressed(Gender.male),
                          child: ReusableCard(
                            color: selectedGender == Gender.male
                                ? kactiveCardColor
                                : kinActiveCardColor,
                            child: IconContent(
                              icon: FontAwesomeIcons.mars,
                              text: 'Male',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _genderPressed(Gender.female),
                          child: ReusableCard(
                            color: selectedGender == Gender.female
                                ? kactiveCardColor
                                : kinActiveCardColor,
                            child: IconContent(
                              icon: FontAwesomeIcons.venus,
                              text: 'Female',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Height', style: klabelTextStyle),
                        SizedBox(height: 10.0),
                        UnitRow(
                          value: heightValue,
                          unit: 'cm',
                        ),
                        SizedBox(height: 10.0),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kgeryColor,
                            activeTrackColor: Colors.white,
                            thumbColor: kbtnColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 13.0),
                            overlayShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20.0),
                            overlayColor: kbtnColor,
                          ),
                          child: Slider(
                            value: heightValue.toDouble(),
                            max: 200.0,
                            min: 100.0,
                            onChanged: (value) => _onSliderChanged(value),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                            color: kactiveCardColor,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 7.0),
                                  Text('Weight', style: klabelTextStyle),
                                  SizedBox(height: 7.0),
                                  UnitRow(
                                    value: weight,
                                    unit: 'kg',
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        RoundedIconBtn(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: _onWeightAddPreesed,
                                        ),
                                        RoundedIconBtn(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: _onWeightMinusPreesed,
                                        ),
                                      ],
                                    ),
                                  )
                                ])),
                      ),
                      Expanded(
                          child: ReusableCard(
                        color: kactiveCardColor,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 7.0),
                              Text('Age', style: klabelTextStyle),
                              SizedBox(height: 7.0),
                              Text('$age', style: knumberTextStyle),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RoundedIconBtn(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: _onAgeAddPreesed,
                                    ),
                                    RoundedIconBtn(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: _onAgeMinusPreesed,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      )),
                    ],
                  ),
                ),
                BottomButton(text: 'Calculate', onPreesed: _onCalculatePreesed)
              ],
            ),
          ),
        ));
  }

  _genderPressed(Gender _gender) {
    setState(() {
      selectedGender = _gender;
    });
  }

  _onSliderChanged(double value) {
    setState(() {
      heightValue = value.round();
    });
  }

  _onWeightAddPreesed() {
    setState(() {
      weight += 1;
    });
  }

  _onWeightMinusPreesed() {
    if (weight > 0) {
      setState(() {
        weight -= 1;
      });
    }
  }

  _onAgeAddPreesed() {
    setState(() {
      age += 1;
    });
  }

  _onAgeMinusPreesed() {
    if (age > 0) {
      setState(() {
        age -= 1;
      });
    }
  }

  _onCalculatePreesed() {
    CalculatorBrain _calculatorBrain = CalculatorBrain(
      weight: weight, 
      height: heightValue
    );

    Navigator.of(context)
    .push(MaterialPageRoute(builder: (_) => 
    ResultsPage(calculatorBrain: _calculatorBrain)
    ));
  }
}

class UnitRow extends StatelessWidget {
  const UnitRow({@required this.value, @required this.unit});

  final int value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text('$value', style: knumberTextStyle),
        Text('$unit', style: klabelTextStyle.copyWith(fontSize: 16)),
      ],
    );
  }
}

class RoundedIconBtn extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  RoundedIconBtn({this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(height: 35.0, width: 35.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        size: 15.0,
      ),
      onPressed: onPressed,
    );
  }
}
