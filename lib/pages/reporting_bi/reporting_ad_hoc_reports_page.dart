import 'package:flutter/material.dart';

class ReportingAdHocReportsPage extends StatelessWidget {
  const ReportingAdHocReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad-hoc Reports'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.edit_note_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ad-hoc Reports',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Build reports for specific business questions.'),
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
                    rows: const [
                      DataRow(
                        cells: [
                          DataCell(Text('Primary Record')),
                          DataCell(Text('Active')),
                          DataCell(Text('Current')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Secondary Record')),
                          DataCell(Text('Active')),
                          DataCell(Text('Updated Today')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Pending Record')),
                          DataCell(Text('Pending')),
                          DataCell(Text('Needs Review')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Archived Record')),
                          DataCell(Text('Archived')),
                          DataCell(Text('Historical')),
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
