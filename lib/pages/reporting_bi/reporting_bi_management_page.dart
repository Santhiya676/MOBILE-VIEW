import 'package:flutter/material.dart';

class ReportingBiManagementPage extends StatelessWidget {
  const ReportingBiManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BI Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.dashboard_customize_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BI Management',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Manage business intelligence dashboards, datasets and BI resources.',
                      ),
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
                          DataCell(Text('Executive BI')),
                          DataCell(Text('Active')),
                          DataCell(Text('12 Dashboards')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Sales BI')),
                          DataCell(Text('Active')),
                          DataCell(Text('18 Dashboards')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Operations BI')),
                          DataCell(Text('Active')),
                          DataCell(Text('9 Dashboards')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Finance BI')),
                          DataCell(Text('Pending')),
                          DataCell(Text('Needs Review')),
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
