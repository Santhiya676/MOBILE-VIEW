import 'package:flutter/material.dart';

class RevenueRecognitionPage extends StatelessWidget {
  const RevenueRecognitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revenue Recognition'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.fact_check_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Revenue Recognition',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage recognized and deferred revenue.'),
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
                DataCell(Text('Recognized Revenue')),
                DataCell(Text('₹21.6 Cr')),
                DataCell(Text('Current Year')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Deferred Revenue')),
                DataCell(Text('₹3.2 Cr')),
                DataCell(Text('Pending Recognition')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contract Revenue')),
                DataCell(Text('₹18.4 Cr')),
                DataCell(Text('Recognized')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Adjustment Entries')),
                DataCell(Text('24')),
                DataCell(Text('Pending Review')),
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
