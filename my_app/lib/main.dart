import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_app/Theme/ThemeApp.dart';
import 'package:my_app/Widgets/transactionList.dart';
import 'models/Transaction.dart';
import 'Widgets/chart.dart';
import 'Widgets/newTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    initializeDateFormatting('co_ES', null).then((_) => () {});
    return MaterialApp(
      title: 'Gastos personales',
      theme: ThemeApp.Theme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    Iterable<Transaction> list = _userTransactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    });
    return list.toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
        id: date.toString(), title: title, amount: amount, date: date);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction() {
    showModalBottomSheet(
      context: (context),
      enableDrag: true,
      isDismissible: true,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) {
        return transaction.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Gastos personales'),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(),
            icon: const Icon(Icons.add))
      ],
    );
    final usableSpace = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height);
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: usableSpace * 0.25, child: Chart(_recentTransactions)),
            Container(
              height: usableSpace * 0.75,
              child: TransactionList(
                  transactions: _userTransactions,
                  deleteTransaction: _deleteTransaction),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(),
      ),
    );
  }
}
