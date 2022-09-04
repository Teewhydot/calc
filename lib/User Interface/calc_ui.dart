import 'package:calc/Models/calculator_buttons.dart';
import 'package:calc/Models/constants.dart';
import 'package:calc/Models/history_model.dart';
import 'package:calc/Models/themesmodel.dart';
import 'package:calc/User%20Interface/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        debugShowCheckedModeBanner: false,
        home: const CalculatorUI(),
      ),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  int? firstDigit;
  int? secondDigit;
  String history = '';
  String result = '';
  String textToDisplay = '';
  String operation = '';

  buttonOnclick(String buttonValue) {
    if (buttonValue == 'RESET') {
      history = '';
      textToDisplay = '';
      result = '';
      setState(() {
        firstDigit = null;
        secondDigit = null;
      });
    } else if (buttonValue == 'DEL') {
      result = textToDisplay.isEmpty
          ? ''
          : textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (buttonValue == '+' ||
        buttonValue == '-' ||
        buttonValue == 'x' ||
        buttonValue == '/') {
      firstDigit = textToDisplay.isEmpty ? null : int.parse(textToDisplay);
      operation = buttonValue;
      result = firstDigit.toString() + operation;
    } else if (buttonValue == '=') {
      if (firstDigit == null) {
      } else {
        String second = textToDisplay.substring(
            firstDigit.toString().length + 1, textToDisplay.length);
        secondDigit = int.parse(second);
        history = firstDigit.toString() +
            operation.toString() +
            secondDigit.toString();
        if (operation == '+') {
          int res = firstDigit! + secondDigit!;
          result = res.toString();
        } else if (operation == '-') {
          result = '${firstDigit! - secondDigit!}';
        } else if (operation == 'x') {
          result = '${firstDigit! * secondDigit!}';
        } else if (operation == '/') {
          result = '${firstDigit! / secondDigit!}';
        }
        //provider code here
        context.read<HistoryProvider>().addToHistory(history, result);
      }
    } else {
      result = textToDisplay + buttonValue;
    }
    setState(() {
      textToDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Color? getTextToDisplayColor() {
      if (themeProvider.isDark && textToDisplay.isEmpty) {
        return Colors.white24;
      } else if (themeProvider.isDark && textToDisplay.isEmpty == false) {
        return Colors.white;
      } else if (themeProvider.isDark == false && textToDisplay.isEmpty) {
        return Colors.black45;
      } else {
        return Colors.black;
      }
    }

    final text =
        Provider.of<ThemeProvider>(context, listen: false).isDark == true
            ? 'Dark Theme'
            : 'Light Theme';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: TextButton(
            style: const ButtonStyle(),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const History()));
            },
            child: const Center(
                child: Text(
              'History',
            ))),
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
              margin: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(5.0.r),
                        child: Text(
                          history,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 40.sp,
                            color: getTextToDisplayColor(),
                          ),
                        ),
                      )),
                  addVerticalSpacing(20),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(5.0.r),
                        child: Text(
                          textToDisplay.isEmpty ? '0' : textToDisplay,

                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 40.sp,
                            color: getTextToDisplayColor(),
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
                margin: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
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
                                    '00', buttonOnclick)),
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
                                    'RESET',
                                    themeProvider.isDark
                                        ? resetButtonColorDark
                                        : resetButtonColorLight,
                                    buttonOnclick)),
                            Expanded(
                                child: SpecialButtons(
                                    '=',
                                    themeProvider.isDark
                                        ? equalSignColorDark
                                        : equalSignColorLight,
                                    buttonOnclick)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
