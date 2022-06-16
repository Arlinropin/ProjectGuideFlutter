import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_app/Theme/ThemeApp.dart';
import 'package:my_app/Widgets/transactionList.dart';
import 'models/Transaction.dart';
import 'Widgets/chart.dart';
import 'Widgets/newTransaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

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

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    print('Build Main');
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text('Gastos personales'),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(),
            icon: const Icon(Icons.add))
      ],
    );

    final usableSpace = (mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height);

    final list = TransactionList(
        transactions: _userTransactions, deleteTransaction: _deleteTransaction);

    final chart = Chart(_recentTransactions);

    final switchLandscape =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Mostrar el gráfico'),
      Switch.adaptive(
          activeColor: Theme.of(context).accentColor,
          value: _showChart,
          onChanged: (value) {
            setState(() {
              _showChart = value;
            });
          })
    ]);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isLandscape
                ? Column(children: [
                    switchLandscape,
                    Container(
                        height: usableSpace, child: _showChart ? chart : list)
                  ])
                : Column(children: [
                    Container(height: usableSpace * 0.3, child: chart),
                    Container(height: usableSpace * 0.7, child: list)
                  ])
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(),
            ),
    );
  }
}
