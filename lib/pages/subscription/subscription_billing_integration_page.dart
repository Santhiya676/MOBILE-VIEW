import 'package:flutter/material.dart';

class SubscriptionBillingIntegrationPage extends StatelessWidget {
  const SubscriptionBillingIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing Integration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.receipt_long_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Billing Integration',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage subscription billing connections and billing status.'),
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
                DataCell(Text('Payment Gateway')),
                DataCell(Text('Connected')),
                DataCell(Text('Healthy')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Invoice Service')),
                DataCell(Text('Connected')),
                DataCell(Text('Healthy')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Tax Service')),
                DataCell(Text('Connected')),
                DataCell(Text('Healthy')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Billing Sync')),
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
