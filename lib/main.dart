import 'package:expense_tracker_app/widget/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
