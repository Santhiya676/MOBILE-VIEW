import 'package:flutter/material.dart';

class RevenueCommissionManagementPage extends StatelessWidget {
  const RevenueCommissionManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commission Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.percent_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Commission Management',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Track commissions and incentive payouts.'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Details')),
                    ],
                    rows: [
            DataRow(
              cells: [
                DataCell(Text('Sales Commissions')),
                DataCell(Text('₹12.6 L')),
                DataCell(Text('This Month')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Partner Commissions')),
                DataCell(Text('₹8.4 L')),
                DataCell(Text('This Month')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Pending Payouts')),
                DataCell(Text('₹4.2 L')),
                DataCell(Text('18 Records')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Commission Plans')),
                DataCell(Text('12')),
                DataCell(Text('Active')),
              ],
            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
