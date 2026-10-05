import 'package:flutter/material.dart';

class SubscriptionPlansFeaturesPage extends StatelessWidget {
  const SubscriptionPlansFeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans & Features'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.view_list_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plans & Features',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage subscription plans and their available features.'),
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
                DataCell(Text('Starter Plan')),
                DataCell(Text('Active')),
                DataCell(Text('10 Features')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Business Plan')),
                DataCell(Text('Active')),
                DataCell(Text('24 Features')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Enterprise Plan')),
                DataCell(Text('Active')),
                DataCell(Text('42 Features')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Custom Plan')),
                DataCell(Text('Draft')),
                DataCell(Text('Custom Features')),
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
