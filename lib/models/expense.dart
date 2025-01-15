import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // initializer list


  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final Category category;
}
