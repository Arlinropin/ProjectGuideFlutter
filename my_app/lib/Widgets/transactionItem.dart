import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/Transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction item;
  final Function delete;

  TransactionItem(this.item, this.delete);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(child: Text('\$${item.amount}')),
          ),
        ),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMMMMd('es').format(item.date)),
        trailing: mediaQuery.size.width > 360
            ? TextButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  'Borrar',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
                onPressed: () => delete(item.id))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => delete(item.id),
              ),
      ),
    );
  }
}
