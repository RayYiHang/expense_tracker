import 'package:expense_tracker/widgets/add_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
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
      title: 'Groceries',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'New phone',
      amount: 500.0,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'King Burger',
      amount: 20.0,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _submitExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _addExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => AddExpense(
              onSubmitExpense: _submitExpense,
            ));
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses'), actions: [
        IconButton(
          onPressed: _addExpense,
          icon: const Icon(Icons.add),
        )
      ]),
      body: ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense),
    );
  }
}
