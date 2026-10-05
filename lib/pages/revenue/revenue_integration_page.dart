import 'package:flutter/material.dart';

class RevenueIntegrationPage extends StatelessWidget {
  const RevenueIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.integration_instructions_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Integration',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage integrations with billing and financial systems.'),
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
                DataCell(Text('Billing System')),
                DataCell(Text('Connected')),
                DataCell(Text('Healthy')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Finance Service')),
                DataCell(Text('Connected')),
                DataCell(Text('Healthy')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Payment Gateway')),
                DataCell(Text('Connected')),
                DataCell(Text('Healthy')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Revenue Sync')),
                DataCell(Text('Running')),
                DataCell(Text('Last sync: Today')),
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
