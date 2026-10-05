import 'package:flutter/material.dart';

class SubscriptionTrialManagementPage extends StatelessWidget {
  const SubscriptionTrialManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial Management'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trial Management',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage tenant trials, trial periods and conversion status.'),
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
                DataCell(Text('Northwind Ltd')),
                DataCell(Text('12 Days Left')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Bright Solutions')),
                DataCell(Text('5 Days Left')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Vertex Systems')),
                DataCell(Text('Expired')),
                DataCell(Text('Not Converted')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Apex Industries')),
                DataCell(Text('20 Days Left')),
                DataCell(Text('Active')),
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
