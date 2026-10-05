import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class CostingPage extends StatelessWidget {
  const CostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Costing',
      subtitle: 'Review costs by department, project and activity.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Costing List',
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
          columns: ['Cost ID', 'Cost Center', 'Budget', 'Actual', 'Used'],
          rows: [['CST-3001', 'Warehouse Operations', '₹1,240,000', '₹1,180,000', '95%'], ['CST-3002', 'Distribution', '₹980,000', '₹915,000', '93%'], ['CST-3003', 'Customer Support', '₹620,000', '₹570,000', '92%'], ['CST-3004', 'Technology', '₹1,150,000', '₹1,090,000', '95%'], ['CST-3005', 'Administration', '₹410,000', '₹385,000', '94%']],
        ),
      ),
    );
  }
}
