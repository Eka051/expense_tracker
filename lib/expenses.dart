import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 35.89,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Groceries',
      amount: 50.00,
      date: DateTime.utc(2024, 10, 5),
      category: Category.food,
    ),
    Expense(
      title: 'Flight to Singapore',
      amount: 250.70,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Chart'),
          Text('Expensis List')
        ],
      )
    );
  }
}