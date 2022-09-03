import 'package:calc/Models/history_model.dart';
import 'package:calc/Models/themesmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'User Interface/calc_ui.dart';

void main() {
  runApp(MultiProvider(
    builder: (context,_){
      return const MyApp();
    },
      providers: [
    ChangeNotifierProvider(create: (context)=> ThemeProvider()),
    ChangeNotifierProvider(create: (context)=> HistoryProvider()),
  ]));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CalcHome();
  }
}
