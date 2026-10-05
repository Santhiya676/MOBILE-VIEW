import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class GeneralLedgerPage extends StatelessWidget {
  const GeneralLedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'General Ledger',
      subtitle: 'Manage journal entries, accounts and ledger balances.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'General Ledger List',
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
          columns: ['Reference', 'Date', 'Account', 'Description', 'Debit', 'Credit'],
          rows: [['GL-1001', '10 Sep 2026', 'Cash & Bank', 'Customer payment received', '₹420,000', '₹0'], ['GL-1002', '10 Sep 2026', 'Sales Revenue', 'Customer invoice posted', '₹0', '₹610,000'], ['GL-1003', '09 Sep 2026', 'Office Expense', 'Monthly office expense', '₹85,000', '₹0'], ['GL-1004', '09 Sep 2026', 'Accounts Payable', 'Vendor invoice posted', '₹0', '₹275,000'], ['GL-1005', '08 Sep 2026', 'Depreciation', 'Monthly depreciation', '₹145,000', '₹0']],
        ),
      ),
    );
  }
}
