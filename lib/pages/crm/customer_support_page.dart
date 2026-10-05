import 'package:flutter/material.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tickets = [
      {
        'ticket': 'CS-1001',
        'customer': 'ABC Technologies',
        'subject': 'Login Issue',
        'priority': 'High',
        'status': 'Open',
      },
      {
        'ticket': 'CS-1002',
        'customer': 'Global Systems',
        'subject': 'Invoice Question',
        'priority': 'Medium',
        'status': 'In Progress',
      },
      {
        'ticket': 'CS-1003',
        'customer': 'Smart Industries',
        'subject': 'Product Support',
        'priority': 'Low',
        'status': 'Resolved',
      },
      {
        'ticket': 'CS-1004',
        'customer': 'Prime Solutions',
        'subject': 'Account Update',
        'priority': 'Medium',
        'status': 'Open',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Support'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Create Ticket'),
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
              'Customer Support',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage customer issues, requests and support tickets.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search tickets...',
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
                      DataColumn(label: Text('Ticket')),
                      DataColumn(label: Text('Customer')),
                      DataColumn(label: Text('Subject')),
                      DataColumn(label: Text('Priority')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: tickets.map((ticket) {
                      return DataRow(
                        cells: [
                          DataCell(Text(ticket['ticket']!)),
                          DataCell(Text(ticket['customer']!)),
                          DataCell(Text(ticket['subject']!)),
                          DataCell(Chip(label: Text(ticket['priority']!))),
                          DataCell(Chip(label: Text(ticket['status']!))),
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
