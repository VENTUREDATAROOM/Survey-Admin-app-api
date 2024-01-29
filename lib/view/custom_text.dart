import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomText(this.text, this.fontSize, this.fontWeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class CustomText2 extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomText2(this.text, this.fontSize, this.fontWeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
