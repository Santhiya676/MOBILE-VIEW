import 'package:flutter/material.dart';

class TenantSubscriptionsPage extends StatelessWidget {
  const TenantSubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenant Subscriptions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.business_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tenant Subscriptions',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Manage subscriptions assigned to enterprise tenants.'),
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
                DataCell(Text('Business')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Global Tech')),
                DataCell(Text('Enterprise')),
                DataCell(Text('Active')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Northwind Ltd')),
                DataCell(Text('Starter')),
                DataCell(Text('Trial')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contoso Group')),
                DataCell(Text('Enterprise')),
                DataCell(Text('Renewal Due')),
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
