//This is a blue print for my expense data

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//This is a utility class object to generate unique ids
const uuid = Uuid();

//This Category is custom type
enum Category { food, travel, leisure, work }

//DateFormat() provided by intl package
final formatter = DateFormat.yMd();
const categoryIcons = {
  //This is a map value
  Category.food: Icons.dinner_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  //Here we'll generating id dynamically
  //whenever this class object is instantiated
  final String id;
  final Category category;
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); //This V4() will generate unique string id
  //get is a getter which don't need any parenthesis
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;
  ExpenseBucket({required this.category, required this.expenses});

  double get totalExpense {
    double sum = 0;
    //for every iteration expense get one expense from expenses
    //which then can be used to add expense amount to sum variable
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
