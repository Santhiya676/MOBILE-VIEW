import 'package:flutter/material.dart';

class SubscriptionPaymentTrackingPage extends StatelessWidget {
  const SubscriptionPaymentTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Tracking'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.payments_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Tracking',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Track subscription payments and payment status.'),
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
                DataCell(Text('INV-10482')),
                DataCell(Text('Paid')),
                DataCell(Text('₹48,000')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('INV-10483')),
                DataCell(Text('Pending')),
                DataCell(Text('₹72,000')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('INV-10484')),
                DataCell(Text('Paid')),
                DataCell(Text('₹1,20,000')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('INV-10485')),
                DataCell(Text('Overdue')),
                DataCell(Text('₹36,000')),
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
