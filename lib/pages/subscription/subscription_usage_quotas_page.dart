import 'package:flutter/material.dart';

class SubscriptionUsageQuotasPage extends StatelessWidget {
  const SubscriptionUsageQuotasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage & Quotas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.data_usage_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Usage & Quotas',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Monitor tenant usage against subscription limits.'),
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
                DataCell(Text('Acme Corporation')),
                DataCell(Text('78%')),
                DataCell(Text('Within Quota')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Global Tech')),
                DataCell(Text('91%')),
                DataCell(Text('Near Limit')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Northwind Ltd')),
                DataCell(Text('46%')),
                DataCell(Text('Within Quota')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contoso Group')),
                DataCell(Text('100%')),
                DataCell(Text('Quota Reached')),
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
