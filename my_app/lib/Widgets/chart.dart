import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chartBar.dart';
import '../models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get gropedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E('es').format(weekday).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return gropedTransactionValues.fold(0.0, (sum, item) {
      double itemdouble = item['amount'] as double;
      return sum + itemdouble;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build NewTransaction');
    return Container(
        child: Card(
            elevation: 6,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: gropedTransactionValues.map((data) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        data['day'] as String,
                        data['amount'] as double,
                        totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending),
                  );
                }).toList(),
              ),
            )));
  }
}
