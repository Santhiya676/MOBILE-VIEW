import 'package:flutter/material.dart';

class DocumentTemplatesPage extends StatelessWidget {
  const DocumentTemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Templates'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.description_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Document Templates',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Create and manage reusable enterprise document templates.'),
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
                DataCell(Text('Offer Letter')),
                DataCell(Text('Active')),
                DataCell(Text('HR')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Purchase Order')),
                DataCell(Text('Active')),
                DataCell(Text('Procurement')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Sales Quotation')),
                DataCell(Text('Active')),
                DataCell(Text('Sales')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Service Agreement')),
                DataCell(Text('Draft')),
                DataCell(Text('Legal')),
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
