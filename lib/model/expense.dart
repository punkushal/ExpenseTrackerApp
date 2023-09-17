//This is a blue print for my expense data

import 'package:uuid/uuid.dart';

//This is a utility class object to generate unique ids
const uuid = Uuid();

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  //Here we'll generating id dynamically
  //whenever this class object is instantiated
  final String id;
  Expense({required this.title, required this.amount, required this.date})
      : id = uuid.v4(); //This V4() will generate unique string id
}
