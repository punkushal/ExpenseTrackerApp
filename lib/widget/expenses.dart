//This file is used to display and handle user interface
import 'package:expense_tracker_app/widget/expense_list/expense_list.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    final List<Expense> _registeredExpenses = [
      Expense(
          title: 'Flutter Course',
          amount: 12000,
          date: DateTime.now(),
          category: Category.work),
      Expense(
          title: 'Cinema',
          amount: 2000,
          date: DateTime.now(),
          category: Category.leisure),
    ];
    return Scaffold(
      body: Column(
        children: [
          const Text('Expenses chart list'),
          Expanded(child: ExpenseList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
