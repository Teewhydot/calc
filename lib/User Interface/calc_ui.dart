import 'package:calc/Models/themesmodel.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      theme: Mythemes.darktheme,
      darkTheme: Mythemes.lighttheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF3A414F),
        appBar: AppBar(
          title: const Text('CALC'),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('calc'),
                        Row(
                          children: [
                            const Text('Theme'),
                            ToggleButtons(
                              onPressed: (int index){
                                if(index==0){
                                  setState(() {
                                    index = 2;
                                  });
                                } else {
                                  setState(() {
                                    index = 1;
                                  });
                                }

                              },
                                isSelected: const [true, false],
                                children: (const [
                                  Icon(Icons.light_mode),
                                  Icon(Icons.dark_mode),
                                ]))
                          ],
                        )
                      ],
                    )
                  ],
                )),
            Expanded(flex: 3, child: Column()),
          ],
        ),
      ),
    );
  }
}
