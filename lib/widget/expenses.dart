//This file is used to display and handle user interface
import 'package:expense_tracker_app/widget/chart/chart.dart';
import 'package:expense_tracker_app/widget/expense_list/expense_list.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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
  void _openAddExpensOverlay() {
    showModalBottomSheet(
      isScrollControlled: true, //so contents are not overlapped to each other
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addNewExpense),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

//To remove existing expense from the interface
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //To immediatly clear the snack message when next snack message is coming
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //This width is used to display our app in both potrait as well as landscape mode
    //So that availabe space is maintained properly and display correctly
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpensOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 //if width less than 600 column() works otherwise Row()
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                //Here we use Expanded to Chart() bcuz without of it cannot display
                //on the screen because inside of Chart we set Container() width as
                //double.infinity so it takes as more width as possible
                //Row() by default has this property so that's why we use Expanded Widget
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
