import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class MultiCurrencyPage extends StatelessWidget {
  const MultiCurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Multi-Currency',
      subtitle: 'Manage currencies and exchange rates.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Multi-Currency List',
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
          columns: ['Currency', 'Name', 'Rate (INR)', 'Base Rate', 'Status'],
          rows: [['USD', 'US Dollar', '₹83.25', '1.0000', 'Active'], ['EUR', 'Euro', '₹97.80', '0.9200', 'Active'], ['GBP', 'British Pound', '₹113.60', '0.7900', 'Active'], ['AED', 'UAE Dirham', '₹22.67', '3.6725', 'Active'], ['SGD', 'Singapore Dollar', '₹64.20', '1.2800', 'Active']],
        ),
      ),
    );
  }
}
