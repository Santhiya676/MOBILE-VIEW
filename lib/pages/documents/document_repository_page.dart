import 'package:flutter/material.dart';

class DocumentRepositoryPage extends StatelessWidget {
  const DocumentRepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Repository'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.folder_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Document Repository',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Browse, organize and manage enterprise documents.'),
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
                DataCell(Text('Active')),
                DataCell(Text('HR')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Vendor Agreement.docx')),
                DataCell(Text('Active')),
                DataCell(Text('Procurement')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Sales Policy.pdf')),
                DataCell(Text('Under Review')),
                DataCell(Text('Sales')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Finance Report.xlsx')),
                DataCell(Text('Active')),
                DataCell(Text('Finance')),
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
