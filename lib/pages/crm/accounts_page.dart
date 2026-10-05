import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accounts = [
      {
        'name': 'ABC Technologies',
        'industry': 'Technology',
        'phone': '+91 98765 43210',
        'owner': 'Rahul',
      },
      {
        'name': 'Global Systems',
        'industry': 'Software',
        'phone': '+91 98765 12345',
        'owner': 'Priya',
      },
      {
        'name': 'Smart Industries',
        'industry': 'Manufacturing',
        'phone': '+91 99887 66554',
        'owner': 'Arjun',
      },
      {
        'name': 'Prime Solutions',
        'industry': 'Consulting',
        'phone': '+91 91234 56789',
        'owner': 'Sneha',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Account'),
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
              'Accounts',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage customer companies and business accounts.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search accounts...',
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
                      DataColumn(label: Text('Account')),
                      DataColumn(label: Text('Industry')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Owner')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: accounts.map((account) {
                      return DataRow(
                        cells: [
                          DataCell(Text(account['name']!)),
                          DataCell(Text(account['industry']!)),
                          DataCell(Text(account['phone']!)),
                          DataCell(Text(account['owner']!)),
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
