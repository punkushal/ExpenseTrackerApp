import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

//This contain my expense list which scrollable
class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});
  //We here building Expense list so for this
  //we've to pass list of Expense from the file where it comes
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
