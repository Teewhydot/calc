import 'package:calc/Models/themesmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'User Interface/calc_ui.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CalcHome();
  }
}
