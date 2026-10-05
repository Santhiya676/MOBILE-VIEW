import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {
        'name': 'Rahul Sharma',
        'account': 'ABC Technologies',
        'email': 'rahul@abc.com',
        'phone': '+91 98765 43210',
      },
      {
        'name': 'Priya Reddy',
        'account': 'Global Systems',
        'email': 'priya@global.com',
        'phone': '+91 98765 12345',
      },
      {
        'name': 'Arjun Kumar',
        'account': 'Smart Industries',
        'email': 'arjun@smart.com',
        'phone': '+91 99887 66554',
      },
      {
        'name': 'Sneha Patel',
        'account': 'Prime Solutions',
        'email': 'sneha@prime.com',
        'phone': '+91 91234 56789',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Contact'),
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
              'Contacts',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage customer contacts and communication details.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search contacts...',
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
                      DataColumn(label: Text('Account')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: contacts.map((contact) {
                      return DataRow(
                        cells: [
                          DataCell(Text(contact['name']!)),
                          DataCell(Text(contact['account']!)),
                          DataCell(Text(contact['email']!)),
                          DataCell(Text(contact['phone']!)),
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
