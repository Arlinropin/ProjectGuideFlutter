import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final title = _titleController.text;
    final amount = _amountController.text;
    final date = _selectedDate;
    if (title.isEmpty || amount.isEmpty || date == null) {
      return;
    } else {
      widget.addNewTransaction(title, double.parse(amount), date);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    print('Show Calendar');
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Wrap(crossAxisAlignment: WrapCrossAlignment.end, children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Gasto'),
          controller: _titleController,
          onSubmitted: (_) => _submitData,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Monto'),
          controller: _amountController,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => _submitData,
        ),
        Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Text(_selectedDate == null
                    ? '¡Sin fecha aún!'
                    : ('Fecha: ' +
                        DateFormat.yMMMMd('es').format(_selectedDate!))),
              ),
              TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Selecciona fecha',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'Agregar transacción',
                style:
                    TextStyle(color: Theme.of(context).textTheme.button?.color),
              )),
        )
      ]),
    );
  }
}
