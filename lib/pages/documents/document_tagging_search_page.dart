import 'package:flutter/material.dart';

class DocumentTaggingSearchPage extends StatelessWidget {
  const DocumentTaggingSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagging & Search'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_offer_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tagging & Search',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Tag documents and quickly find information across the repository.'),
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
                DataCell(Text('HR')),
                DataCell(Text('128 documents')),
                DataCell(Text('Employee')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Finance')),
                DataCell(Text('246 documents')),
                DataCell(Text('Financial')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contracts')),
                DataCell(Text('184 documents')),
                DataCell(Text('Legal')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Policies')),
                DataCell(Text('96 documents')),
                DataCell(Text('Compliance')),
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
