import 'package:flutter/material.dart';

class LeadsPage extends StatelessWidget {
  const LeadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final leads = [
      {
        'name': 'Rahul Sharma',
        'company': 'Tech Solutions',
        'email': 'rahul@techsolutions.com',
        'status': 'New',
        'source': 'Website',
      },
      {
        'name': 'Priya Reddy',
        'company': 'Global Systems',
        'email': 'priya@globalsystems.com',
        'status': 'Contacted',
        'source': 'Referral',
      },
      {
        'name': 'Arjun Kumar',
        'company': 'Smart Industries',
        'email': 'arjun@smartindustries.com',
        'status': 'Qualified',
        'source': 'Campaign',
      },
      {
        'name': 'Sneha Patel',
        'company': 'Future Technologies',
        'email': 'sneha@futuretech.com',
        'status': 'New',
        'source': 'Website',
      },
      {
        'name': 'Vikram Singh',
        'company': 'Prime Solutions',
        'email': 'vikram@primesolutions.com',
        'status': 'Qualified',
        'source': 'Referral',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leads'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Lead'),
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
              'Leads',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'Manage and track your sales leads.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),

            const SizedBox(height: 24),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search leads...',
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
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Company')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Source')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: leads.map((lead) {
                      return DataRow(
                        cells: [
                          DataCell(Text(lead['name']!)),
                          DataCell(Text(lead['company']!)),
                          DataCell(Text(lead['email']!)),
                          DataCell(Chip(label: Text(lead['status']!))),
                          DataCell(Text(lead['source']!)),
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
