//This file is used to display and handle user interface
import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Expense chart list'),
          Text('Expenses..'),
        ],
      ),
    );
  }
}
