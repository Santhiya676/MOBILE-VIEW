import 'package:flutter/material.dart';

class DocumentRetentionPoliciesPage extends StatelessWidget {
  const DocumentRetentionPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retention Policies'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.policy_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Retention Policies',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Define document retention periods and lifecycle rules.'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
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
                DataCell(Text('Employee Records')),
                DataCell(Text('7 Years')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Financial Records')),
                DataCell(Text('10 Years')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contracts')),
                DataCell(Text('8 Years')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Temporary Files')),
                DataCell(Text('1 Year')),
                DataCell(Text('Scheduled')),
              ],
            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
