import 'package:flutter/material.dart';

class SecurityAlertsPage extends StatelessWidget {
  const SecurityAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Alerts'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notifications_active_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Security Alerts',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Review and manage security alerts and incidents.'),
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
