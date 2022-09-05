import 'package:calc/Models/constants.dart';
import 'package:calc/Models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var historyLength = Provider.of<HistoryProvider>(context).numberOfCalc;
    if (historyLength == 0) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
          elevation: 0,
          title: const Text('History'),
        ),
        body: const Center(child: Text("You haven't made any calculations yet")),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('History'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Clear History',
            child:  const Icon(
              Icons.clear,
              color:Colors.white,
            ),
            onPressed: () {
              context.read<HistoryProvider>().clearHistory();
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
                      );
                    },
                    shrinkWrap: true,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

class HistoryUI extends StatelessWidget {
  final String history;
  final String result;

  const HistoryUI(this.history, this.result, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 20.h,
        child: Row(
          children: [
            Text(history),
            addHorizontalSpacing(10.w),
            const Text('='),
            addHorizontalSpacing(10.w),
            Text(result),
          ],
        ),
      ),
    );
  }
}
