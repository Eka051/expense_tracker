import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                    'Rp. ${NumberFormat('#,###', 'id_ID').format(expense.amount)}'),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 8),
                        Text(expense.date.toString()),
                      ],
                    )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
