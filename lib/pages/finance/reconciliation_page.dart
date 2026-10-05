import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class ReconciliationPage extends StatelessWidget {
  const ReconciliationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Reconciliation',
      subtitle: 'Match accounting records with bank and transaction statements.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Reconciliation List',
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
          columns: ['Reference', 'Account', 'Book Balance', 'Statement Balance', 'Status'],
          rows: [['REC-7001', 'Main Bank Account', '₹8,420,000', '₹8,420,000', 'Matched'], ['REC-7002', 'Operating Account', '₹4,180,000', '₹4,150,000', 'Unmatched'], ['REC-7003', 'Petty Cash', '₹125,000', '₹125,000', 'Matched'], ['REC-7004', 'Payment Gateway', '₹2,840,000', '₹2,810,000', 'Pending'], ['REC-7005', 'Payroll Account', '₹3,250,000', '₹3,250,000', 'Matched']],
        ),
      ),
    );
  }
}
