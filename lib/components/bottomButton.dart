import 'package:flutter/material.dart';
import 'package:bmi_calculator/constances.dart';


class BottomButton extends StatelessWidget {
  final Function onPreesed;
  final String text;
  const BottomButton({
    this.onPreesed, 
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPreesed,
      child: Container(
        color: kbtnColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbtnHeight,
        child: Center(
          child: Text(
            '$text',
            style: kBtnTextStyle,
          ),
        ),
      ),
    );
  }
}