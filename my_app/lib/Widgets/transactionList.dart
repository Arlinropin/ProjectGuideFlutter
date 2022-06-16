import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Widgets/transactionItem.dart';
import 'package:my_app/models/Transaction.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) deleteTransaction;

  TransactionList(
      {required this.transactions, required this.deleteTransaction});

  var index = 0;
  @override
  Widget build(BuildContext context) {
    print('Build TransactionList');
    return Container(
      child: (transactions.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (contextList, index) {
                return TransactionItem(transactions[index], deleteTransaction);
              },
              itemCount: transactions.length,
            )
          : LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  const Text('\n¡No hay transacciones aún!\n'),
                  SizedBox(height: constraints.maxHeight * 0.01),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              );
            }),
    );
  }
}
