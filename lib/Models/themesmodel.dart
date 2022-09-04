import 'package:calc/Models/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: const Color(0xffe6e6e6),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade900),
      foregroundColor: MaterialStateProperty.all<Color>(
        const Color(0xffe6e6e6),
      ),
    )),
    scaffoldBackgroundColor: Colors.grey.shade900,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: resetButtonColorDark),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffe6e6e6), foregroundColor: Colors.black),
    scaffoldBackgroundColor: const Color(0xffe6e6e6),
    primaryColor: const Color(0xffe6e6e6),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: resetButtonColorLight,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(0xffe6e6e6),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.black,
      ),
    )),
  );
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
        value: themeProvider.isDark,
        onChanged: (value) {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
        });
  }
}
