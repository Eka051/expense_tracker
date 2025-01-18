import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/services.dart';

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
      amount: 125000,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Groceries',
      amount: 50000,
      date: DateTime.utc(2024, 10, 5),
      category: Category.food,
    ),
    Expense(
      title: 'Flight to Singapore',
      amount: 545000,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseForm() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AnnotatedRegion(
        value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        child: NewExpense(onAddExpense: _addExpense),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 113, 212),
        foregroundColor: Colors.white,
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add), onPressed: _openAddExpenseForm),
        ],
      ),
      body: Column(
        children: [
          Text('Chart'),
          Expanded(
            child: mainContent, 
          ),
        ],
      ),
    );
  }
}
