import 'package:flutter/material.dart';
import 'finance_widgets.dart';

class AssetManagementPage extends StatelessWidget {
  const AssetManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FinancePageShell(
      title: 'Asset Management',
      subtitle: 'Manage company assets and depreciation.',
      actions: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
      child: FinanceSectionCard(
        title: 'Asset Management List',
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
          columns: ['Asset ID', 'Asset', 'Category', 'Value', 'Status'],
          rows: [['AST-1001', 'Office Building', 'Property', '₹12,500,000', 'Active'], ['AST-1002', 'Delivery Vehicles', 'Vehicles', '₹4,200,000', 'Active'], ['AST-1003', 'Laptop Equipment', 'IT Equipment', '₹1,850,000', 'Active'], ['AST-1004', 'Warehouse Equipment', 'Equipment', '₹2,400,000', 'Maintenance'], ['AST-1005', 'Office Furniture', 'Furniture', '₹850,000', 'Active']],
        ),
      ),
    );
  }
}
