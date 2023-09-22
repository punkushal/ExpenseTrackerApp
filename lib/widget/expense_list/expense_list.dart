import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

//This contain my expense list which scrollable
class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  //We here building Expense list so for this
  //we've to pass list of Expense from the file where it comes
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
