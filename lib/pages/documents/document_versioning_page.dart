import 'package:flutter/material.dart';

class DocumentVersioningPage extends StatelessWidget {
  const DocumentVersioningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Versioning'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Document Versioning',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Track document versions and revision history.'),
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
                DataCell(Text('Employee Handbook.pdf')),
                DataCell(Text('v4')),
                DataCell(Text('Updated 10 Sep 2026')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Vendor Agreement.docx')),
                DataCell(Text('v3')),
                DataCell(Text('Updated 08 Sep 2026')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Sales Policy.pdf')),
                DataCell(Text('v2')),
                DataCell(Text('Updated 05 Sep 2026')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Finance Report.xlsx')),
                DataCell(Text('v7')),
                DataCell(Text('Updated 01 Sep 2026')),
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
