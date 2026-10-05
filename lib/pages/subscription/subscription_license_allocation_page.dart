import 'package:flutter/material.dart';

class SubscriptionLicenseAllocationPage extends StatelessWidget {
  const SubscriptionLicenseAllocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('License Allocation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.assignment_ind_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'License Allocation',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Allocate and monitor subscription licenses for tenants.'),
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
                DataCell(Text('Acme Corporation')),
                DataCell(Text('82 / 100')),
                DataCell(Text('82% Used')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Global Tech')),
                DataCell(Text('240 / 250')),
                DataCell(Text('96% Used')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Northwind Ltd')),
                DataCell(Text('18 / 25')),
                DataCell(Text('72% Used')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contoso Group')),
                DataCell(Text('498 / 500')),
                DataCell(Text('99% Used')),
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
