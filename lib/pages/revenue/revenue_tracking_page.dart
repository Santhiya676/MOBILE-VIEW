import 'package:flutter/material.dart';

class RevenueTrackingPage extends StatelessWidget {
  const RevenueTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revenue Tracking'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.trending_up_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Revenue Tracking',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Monitor revenue generated across tenants, products and services.'),
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
                DataCell(Text('Subscription Revenue')),
                DataCell(Text('₹1.42 Cr')),
                DataCell(Text('This Month')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Service Revenue')),
                DataCell(Text('₹68.4 L')),
                DataCell(Text('This Month')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Usage Revenue')),
                DataCell(Text('₹31.8 L')),
                DataCell(Text('This Month')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Other Revenue')),
                DataCell(Text('₹4.2 L')),
                DataCell(Text('This Month')),
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
