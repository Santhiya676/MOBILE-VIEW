import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'activity': 'Call with Rahul Sharma',
        'type': 'Call',
        'date': '10 Sep 2026',
        'status': 'Completed',
      },
      {
        'activity': 'Product Demo',
        'type': 'Meeting',
        'date': '11 Sep 2026',
        'status': 'Scheduled',
      },
      {
        'activity': 'Follow-up Email',
        'type': 'Email',
        'date': '12 Sep 2026',
        'status': 'Pending',
      },
      {
        'activity': 'Client Meeting',
        'type': 'Meeting',
        'date': '14 Sep 2026',
        'status': 'Scheduled',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Activity'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Activities',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track calls, meetings, emails and follow-ups.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Activity')),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: activities.map((activity) {
                      return DataRow(
                        cells: [
                          DataCell(Text(activity['activity']!)),
                          DataCell(Text(activity['type']!)),
                          DataCell(Text(activity['date']!)),
                          DataCell(Chip(label: Text(activity['status']!))),
                          DataCell(
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
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
