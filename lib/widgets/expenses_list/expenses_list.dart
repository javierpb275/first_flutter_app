import 'package:first_flutter_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/models/expense.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  ExpensesListState createState() => ExpensesListState();
}

class ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (ctx, index) {
        final expense = widget.expenses[index];
        return Dismissible(
          key: ValueKey(expense.id),
          onDismissed: (direction) {
            setState(() {
              widget.expenses.removeAt(index);
            });
            widget.onRemoveExpense(expense);
          },
          child: ExpenseItem(expense),
        );
      },
    );
  }
}
