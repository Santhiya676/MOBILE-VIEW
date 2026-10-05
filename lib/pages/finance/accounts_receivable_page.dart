import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class AccountsReceivablePage extends StatelessWidget {
  const AccountsReceivablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Accounts Receivable',
      subtitle: 'Track customer invoices, collections and outstanding balances.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Accounts Receivable List',
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
          columns: ['Reference', 'Customer', 'Date', 'Amount', 'Status'],
          rows: [['AR-4101', 'Acme Corporation', '10 Sep 2026', '₹610,000', 'Pending'], ['AR-4102', 'Bright Retail', '09 Sep 2026', '₹285,000', 'Paid'], ['AR-4103', 'North Star Ltd', '08 Sep 2026', '₹450,000', 'Partial'], ['AR-4104', 'Green Foods', '06 Sep 2026', '₹175,000', 'Overdue'], ['AR-4105', 'Urban Mart', '04 Sep 2026', '₹390,000', 'Paid']],
        ),
      ),
    );
  }
}
