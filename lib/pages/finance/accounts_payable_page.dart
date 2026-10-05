import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class AccountsPayablePage extends StatelessWidget {
  const AccountsPayablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Accounts Payable',
      subtitle: 'Track vendor invoices, due dates and payments.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Accounts Payable List',
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
          columns: ['Reference', 'Vendor', 'Date', 'Amount', 'Status'],
          rows: [['AP-2401', 'Global Supplies', '10 Sep 2026', '₹320,000', 'Pending'], ['AP-2402', 'Metro Logistics', '09 Sep 2026', '₹185,000', 'Paid'], ['AP-2403', 'Tech Solutions', '07 Sep 2026', '₹425,000', 'Partial'], ['AP-2404', 'Office World', '05 Sep 2026', '₹95,000', 'Overdue'], ['AP-2405', 'Prime Services', '03 Sep 2026', '₹210,000', 'Paid']],
        ),
      ),
    );
  }
}
