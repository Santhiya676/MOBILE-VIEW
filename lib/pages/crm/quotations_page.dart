import 'package:flutter/material.dart';

class QuotationsPage extends StatelessWidget {
  const QuotationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quotations = [
      {
        'number': 'QT-1001',
        'customer': 'ABC Technologies',
        'date': '10 Sep 2026',
        'amount': '\$25,000',
        'status': 'Sent',
      },
      {
        'number': 'QT-1002',
        'customer': 'Global Systems',
        'date': '09 Sep 2026',
        'amount': '\$42,000',
        'status': 'Accepted',
      },
      {
        'number': 'QT-1003',
        'customer': 'Smart Industries',
        'date': '08 Sep 2026',
        'amount': '\$18,500',
        'status': 'Draft',
      },
      {
        'number': 'QT-1004',
        'customer': 'Prime Solutions',
        'date': '07 Sep 2026',
        'amount': '\$31,000',
        'status': 'Sent',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotations'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Create Quotation'),
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
              'Quotations',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create and manage customer quotations.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search quotations...',
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
                      DataColumn(label: Text('Quotation')),
                      DataColumn(label: Text('Customer')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: quotations.map((quotation) {
                      return DataRow(
                        cells: [
                          DataCell(Text(quotation['number']!)),
                          DataCell(Text(quotation['customer']!)),
                          DataCell(Text(quotation['date']!)),
                          DataCell(Text(quotation['amount']!)),
                          DataCell(Chip(label: Text(quotation['status']!))),
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
