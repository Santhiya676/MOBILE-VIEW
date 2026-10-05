import 'package:flutter/material.dart';

class OpportunitiesPage extends StatelessWidget {
  const OpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final opportunities = [
      {
        'name': 'Enterprise Software Deal',
        'company': 'ABC Technologies',
        'value': '\$45,000',
        'stage': 'Proposal',
      },
      {
        'name': 'Cloud Services',
        'company': 'Global Systems',
        'value': '\$32,000',
        'stage': 'Negotiation',
      },
      {
        'name': 'ERP Implementation',
        'company': 'Smart Industries',
        'value': '\$75,000',
        'stage': 'Qualified',
      },
      {
        'name': 'Support Contract',
        'company': 'Prime Solutions',
        'value': '\$18,000',
        'stage': 'Proposal',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opportunities'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Opportunity'),
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
              'Opportunities',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track and manage potential sales opportunities.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search opportunities...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Opportunity')),
                      DataColumn(label: Text('Company')),
                      DataColumn(label: Text('Value')),
                      DataColumn(label: Text('Stage')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: opportunities.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item['name']!)),
                          DataCell(Text(item['company']!)),
                          DataCell(Text(item['value']!)),
                          DataCell(Chip(label: Text(item['stage']!))),
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
