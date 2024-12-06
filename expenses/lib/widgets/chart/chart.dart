// ignore_for_file: unused_local_variable

import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpeneseBucket> get buckets {
    return [
      ExpeneseBucket.forCategory(Category.food, expenses),
      ExpeneseBucket.forCategory(Category.gym, expenses),
      ExpeneseBucket.forCategory(Category.travel, expenses),
      ExpeneseBucket.forCategory(Category.work, expenses),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpense) {
        maxTotalExpense = element.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(.3),
          Theme.of(context).colorScheme.primary.withOpacity(.0),
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final ele in buckets)
              ChartBar(
                fill: ele.totalExpenses == 0
                    ? 0
                    : ele.totalExpenses / maxTotalExpense,
              ),
          ],
        )),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: buckets
              .map((e) => Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      categoryIcons[e.category],
                      color:
                      isDarkMode
                      ?Theme.of(context).colorScheme.primary
                      :Theme.of(context).colorScheme.primary.withOpacity(.7),
                    ),
                  )))
              .toList(),
        )
      ]),
    );
  }
}
