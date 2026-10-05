import 'package:flutter/material.dart';

class RevenueInvoicingPage extends StatelessWidget {
  const RevenueInvoicingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoicing'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.receipt_long_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invoicing',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Create, track and manage revenue invoices.'),
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
                DataCell(Text('Invoices Issued')),
                DataCell(Text('1,842')),
                DataCell(Text('Current Month')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Paid Invoices')),
                DataCell(Text('1,536')),
                DataCell(Text('83.4%')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Pending Invoices')),
                DataCell(Text('214')),
                DataCell(Text('11.6%')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Overdue Invoices')),
                DataCell(Text('92')),
                DataCell(Text('5.0%')),
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
