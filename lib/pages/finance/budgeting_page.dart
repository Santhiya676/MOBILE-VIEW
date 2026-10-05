import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class BudgetingPage extends StatelessWidget {
  const BudgetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Budgeting',
      subtitle: 'Plan budgets and compare planned versus actual spending.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Budgeting List',
        trailing: SizedBox(
          width: 220,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              isDense: true,
            ),
          ),
        ),
        child: const FinanceTable(
          columns: ['Budget ID', 'Department', 'Budget', 'Actual', 'Used'],
          rows: [['BUD-2026-01', 'Operations', '₹5,000,000', '₹4,320,000', '86%'], ['BUD-2026-02', 'Sales & Marketing', '₹3,500,000', '₹2,980,000', '85%'], ['BUD-2026-03', 'Human Resources', '₹2,800,000', '₹2,450,000', '88%'], ['BUD-2026-04', 'Technology', '₹4,200,000', '₹3,760,000', '90%'], ['BUD-2026-05', 'Administration', '₹1,600,000', '₹1,210,000', '76%']],
        ),
      ),
    );
  }
}
