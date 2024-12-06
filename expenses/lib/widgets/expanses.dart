// ignore_for_file: unnecessary_to_list_in_spreads
import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/chart/chart.dart';
import 'package:expenses/widgets/expenses_list.dart';
import 'package:expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.work,
      title: 'flutter course',
      amount: 29.9,
      data: DateTime.now(),
    ),
    Expense(
      category: Category.gym,
      title: 'flutter gym',
      amount: 13.9,
      data: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'flutter food',
      amount: 25.4,
      data: DateTime.now(),
    ),
  ];
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter ExpensesTracker '),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  // لعرض او اضافه  كارد عند الضغط غلي اي زر
                  useSafeArea: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (ctx) => NewExpense(onAddExpense: _addExpense),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: width <600?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
                child: ExpensesList(
                    onRemoveExpense: _removeExpense,
                    expenses: _registeredExpenses)),
          ],
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Chart(expenses: _registeredExpenses)),
            Expanded(
                child: ExpensesList(
                    onRemoveExpense: _removeExpense,
                    expenses: _registeredExpenses)),
          ],
        ),
      ),
    );
  }
}
