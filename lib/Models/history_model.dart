import 'package:flutter/material.dart';

class HistoryProvider extends ChangeNotifier{
  final List<String> historyOfCalculations = [];
  final List<String> resultsHistory= [];
  int get numberOfCalc => historyOfCalculations.length;
  List<String> get historyL => historyOfCalculations;
  List<String> get resultsL => resultsHistory;

  void addToHistory(String historyFromUi,result){
    historyOfCalculations.add(historyFromUi);
    resultsHistory.add(result);
    notifyListeners();
  }

  void clearHistory(){
    historyOfCalculations.clear();
    resultsHistory.clear();
    notifyListeners();
  }
}