// ignore_for_file: non_constant_identifier_names, must_be_immutable

// import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Title')),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('amount'), prefixText: '\$'),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? 'no Date selected'
                            : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: () async {
                              final now = DateTime.now();
                              final firstDate =
                                  DateTime(now.year - 3, now.month, now.day);
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: firstDate,
                                lastDate: now,
                              );
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toUpperCase()),
                              ))
                          .toList(),
                      onChanged: (newcat) {
                        if (newcat == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = newcat;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("cancel")),
                  ElevatedButton(
                      onPressed: () {
                        final double? enteredAmont =
                            double.tryParse(_amountController.text);
                        final bool amountIsInvalid =
                            enteredAmont == null || enteredAmont <= 0;
        
                        //
                        if (_titleController.text.trim().isEmpty ||
                            amountIsInvalid ||
                            _selectedDate == null) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: const Text("invalid input",style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)),),
                                    content: const Text(
                                        'Please make sure valid title , amount , data and category was entered'
                                        ,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                                    actions: [
                                      TextButton(
                                          onPressed: () => Navigator.pop(
                                              ctx), // لحذف الشو دايلوج او الرساله
                                          child: const Text('okey')),
                                    ],
                                  ));
                        } else {
                          widget.onAddExpense(Expense(
                            title: _titleController.text,
                            amount: enteredAmont,
                            data: _selectedDate!,
                            category: _selectedCategory,
                          ));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Save Expnse"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// const snackBar = SnackBar(content: Text("Error"));
//ScaffoldMessenger.of(context).showSnackBar(snackBar); // يعرض رساله في اسفل  الشاشه
