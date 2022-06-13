import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return Container(
        child: (transactions.isNotEmpty)
            ? ListView.builder(
                itemBuilder: (contextList, index) {
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(DateFormat.yMMMMd('es')
                          .format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              )
            : Column(
                children: [
                  Text('\n¡No hay transacciones aún!\n'),
                  SizedBox(height: 10),
                  Container(
                      height: 300,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              ));
  }
}
