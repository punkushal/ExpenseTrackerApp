//This is a blue print for my expense data

import 'package:uuid/uuid.dart';

//This is a utility class object to generate unique ids
const uuid = Uuid();

//This Category is custom type
enum Category { food, travel, leisure, work }

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
}
