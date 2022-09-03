import 'package:calc/Models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var historyLength = Provider.of<HistoryProvider>(context).numberOfCalc;
    if (historyLength == 0) {
      return SafeArea(
        child: Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: ListView(scrollDirection: Axis.vertical, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.41,
                child: const Text("You haven't made any calculations yet"),
              ),
            ]),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              tooltip: 'Clear History',
              child: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
              }),
          body: Column(
            children: [
              Flexible(
                child: Consumer<HistoryProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.numberOfCalc,
                      itemBuilder: (context, index) {
                        return HistoryUI(
                            value.historyL[index],
                            value.resultsL[index],
                        );},
                      shrinkWrap: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}


class HistoryUI extends StatelessWidget {
  final String history;
  final String result;

  HistoryUI(this.history,this.result);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
