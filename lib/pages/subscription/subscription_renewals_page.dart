import 'package:flutter/material.dart';

class SubscriptionRenewalsPage extends StatelessWidget {
  const SubscriptionRenewalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renewals'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.autorenew_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Renewals',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage upcoming subscription renewals.'),
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
                DataCell(Text('30 Sep 2026')),
                DataCell(Text('Upcoming')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Global Tech')),
                DataCell(Text('12 Oct 2026')),
                DataCell(Text('Upcoming')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Northwind Ltd')),
                DataCell(Text('18 Sep 2026')),
                DataCell(Text('Action Required')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contoso Group')),
                DataCell(Text('05 Nov 2026')),
                DataCell(Text('Upcoming')),
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
