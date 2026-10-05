import 'package:flutter/material.dart';

class DocumentAccessControlPage extends StatelessWidget {
  const DocumentAccessControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access Control'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lock_outline, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Access Control',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage document permissions and access levels.'),
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
                DataCell(Text('HR Documents')),
                DataCell(Text('Restricted')),
                DataCell(Text('HR Managers')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Sales Documents')),
                DataCell(Text('Department')),
                DataCell(Text('Sales Team')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Vendor Agreements')),
                DataCell(Text('Restricted')),
                DataCell(Text('Procurement')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Public Policies')),
                DataCell(Text('Organization')),
                DataCell(Text('All Employees')),
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
