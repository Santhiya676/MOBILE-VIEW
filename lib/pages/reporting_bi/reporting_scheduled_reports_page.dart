import 'package:flutter/material.dart';

class ReportingScheduledReportsPage extends StatelessWidget {
  const ReportingScheduledReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Reports'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.schedule_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scheduled Reports',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Schedule automated report generation and delivery.'),
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
