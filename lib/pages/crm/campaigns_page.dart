import 'package:flutter/material.dart';

class CampaignsPage extends StatelessWidget {
  const CampaignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = [
      {
        'name': 'Summer Campaign',
        'type': 'Email',
        'start': '01 Sep 2026',
        'leads': '125',
        'status': 'Active',
      },
      {
        'name': 'Product Launch',
        'type': 'Social Media',
        'start': '05 Sep 2026',
        'leads': '210',
        'status': 'Active',
      },
      {
        'name': 'Enterprise Outreach',
        'type': 'Email',
        'start': '15 Aug 2026',
        'leads': '180',
        'status': 'Completed',
      },
      {
        'name': 'Partner Campaign',
        'type': 'Referral',
        'start': '20 Aug 2026',
        'leads': '95',
        'status': 'Completed',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campaigns'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Campaign'),
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
              'Campaigns',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Plan and track marketing campaigns.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Campaign')),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('Start Date')),
                      DataColumn(label: Text('Leads')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: campaigns.map((campaign) {
                      return DataRow(
                        cells: [
                          DataCell(Text(campaign['name']!)),
                          DataCell(Text(campaign['type']!)),
                          DataCell(Text(campaign['start']!)),
                          DataCell(Text(campaign['leads']!)),
                          DataCell(Chip(label: Text(campaign['status']!))),
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
