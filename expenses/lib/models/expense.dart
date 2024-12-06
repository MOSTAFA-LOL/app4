import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMd();

enum Category { food, travel, work, gym }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.gym: Icons.fitness_center,
  Category.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime data;
  final Category category;

  String get formattedData {
    return dateFormat.format(data);
  }

  Expense(
      {required this.title,
      required this.amount,
      required this.data,
      required this.category})
      : id = uuid.v4();
}

class ExpeneseBucket {
  final Category category;
  final List<Expense> expenses;
  ExpeneseBucket(this.category, this.expenses);
  ExpeneseBucket.forCategory(this.category,List<Expense> allExpenses )
  : expenses = allExpenses
  .where((element)=> element.category == category)
  .toList();

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
  
  
}
