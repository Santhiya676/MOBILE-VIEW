import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class FinancialReportsPage extends StatelessWidget {
  const FinancialReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Financial Reports',
      subtitle: 'Generate and review standard financial reports.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Financial Reports List',
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
          columns: ['Report', 'Frequency', 'Last Generated', 'Status'],
          rows: [['Balance Sheet', 'Monthly', '10 Sep 2026', 'Generated'], ['Profit & Loss', 'Monthly', '10 Sep 2026', 'Generated'], ['Cash Flow Statement', 'Monthly', '10 Sep 2026', 'Generated'], ['Trial Balance', 'Daily', '10 Sep 2026', 'Generated'], ['Accounts Receivable Aging', 'Weekly', '09 Sep 2026', 'Generated'], ['Accounts Payable Aging', 'Weekly', '09 Sep 2026', 'Generated']],
        ),
      ),
    );
  }
}
