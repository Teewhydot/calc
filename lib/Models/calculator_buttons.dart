import 'package:flutter/material.dart';

class CalculatorNumberButtons extends StatelessWidget {
  final String buttonText;
  final  Function onPressed;
  const CalculatorNumberButtons(this.buttonText, this.onPressed, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPressed(buttonText),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 70,

        child: Center(child: Text(buttonText,style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),)),
      ),
    );
  }
}

class SpecialButtons extends StatelessWidget {
  final String buttonText;
  final Color color;
  final Function onPressed;
  
  SpecialButtons(this.buttonText,this.color,this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPressed(buttonText),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,

        child: Center(child: Text(buttonText,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),)),
      ),
    );
  }
}
