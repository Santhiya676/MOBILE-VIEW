import 'package:flutter/material.dart';

class RevenueUsageAnalyticsPage extends StatelessWidget {
  const RevenueUsageAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage Analytics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Usage Analytics',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Analyze usage patterns and their revenue impact.'),
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
                DataCell(Text('API Usage')),
                DataCell(Text('78%')),
                DataCell(Text('Revenue Impact: High')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Storage Usage')),
                DataCell(Text('64%')),
                DataCell(Text('Revenue Impact: Medium')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('User Licenses')),
                DataCell(Text('86%')),
                DataCell(Text('Revenue Impact: High')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Workflow Runs')),
                DataCell(Text('52%')),
                DataCell(Text('Revenue Impact: Medium')),
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
