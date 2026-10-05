import 'package:flutter/material.dart';

class DocumentAuditTrailsPage extends StatelessWidget {
  const DocumentAuditTrailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit Trails'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history_edu_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Audit Trails',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Review document access, changes and activity history.'),
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
                DataCell(Text('John Smith')),
                DataCell(Text('Viewed')),
                DataCell(Text('Employee Handbook.pdf')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Priya Kumar')),
                DataCell(Text('Updated')),
                DataCell(Text('Sales Policy.pdf')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('David Lee')),
                DataCell(Text('Downloaded')),
                DataCell(Text('Vendor Agreement.docx')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Admin User')),
                DataCell(Text('Changed Access')),
                DataCell(Text('Finance Report.xlsx')),
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
