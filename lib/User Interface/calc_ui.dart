import 'package:calc/Models/calculator_buttons.dart';
import 'package:calc/Models/constants.dart';
import 'package:calc/Models/themesmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalcHome extends StatelessWidget {
  const CalcHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CalculatorHome();
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({Key? key}) : super(key: key);

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  int firstDigit = 0;
  int secondDigit = 0;
  String history = '';
  String result = '';
  String textToDisplay = '';
  String? operation;

  buttonOnclick(String buttonValue) {
    if (buttonValue == 'RESET') {
      history = '';
      textToDisplay = '';
      result = '';
    }else if(buttonValue == 'DEL'){
      result = textToDisplay.substring(0,textToDisplay.length-1);
    } else if (buttonValue == '+' ||
        buttonValue == '-' ||
        buttonValue == 'x' ||
        buttonValue == '/') {
      firstDigit = int.parse(textToDisplay);
      result = '';
      operation = buttonValue;
    } else if (buttonValue == '=') {
      secondDigit = int.parse(textToDisplay);
      history =
          firstDigit.toString() + operation.toString() + secondDigit.toString();
      if (operation == '+') {
        result = '${firstDigit + secondDigit}';
      } else if (operation == '-') {
        result = '${firstDigit - secondDigit}';
      } else if (operation == 'x') {
        result = '${firstDigit * secondDigit}';
      } else if (operation == '/') {
        result = '${firstDigit / secondDigit}';
      }
    } else {
      result = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text =
        Provider.of<ThemeProvider>(context, listen: false).isDark == true
            ? 'Dark Mode'
            : 'Light Mode';

    return MaterialApp(
      theme: Mythemes.lighttheme,
      darkTheme: Mythemes.darktheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('CALC'),
          actions: [
            Row(
              children: [
                Text(text),
                const ChangeThemeButtonWidget(),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            history,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                          ),
                        )),
                    addVerticalSpacing(20),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            textToDisplay.isEmpty?'0': textToDisplay,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '7', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '8', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '9', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      'DEL', buttonOnclick)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '4', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '5', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '6', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '+', buttonOnclick)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '1', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '2', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '3', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '-', buttonOnclick)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '.', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '0', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      '/', buttonOnclick)),
                              Expanded(
                                  child: CalculatorNumberButtons(
                                      'x', buttonOnclick)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: SpecialButtons(
                                      'RESET', Colors.blueGrey, buttonOnclick)),
                              Expanded(
                                  child: SpecialButtons(
                                      '=', Colors.redAccent, buttonOnclick)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
