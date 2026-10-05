import 'package:flutter/material.dart';

class RevenueFinancialAnalyticsPage extends StatelessWidget {
  const RevenueFinancialAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Analytics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bar_chart_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Financial Analytics',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Analyze revenue performance and financial trends.'),
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
                DataCell(Text('Gross Revenue')),
                DataCell(Text('₹24.8 Cr')),
                DataCell(Text('Current Period')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Net Revenue')),
                DataCell(Text('₹22.9 Cr')),
                DataCell(Text('Current Period')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Gross Margin')),
                DataCell(Text('42.8%')),
                DataCell(Text('Current Period')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Revenue Growth')),
                DataCell(Text('18.4%')),
                DataCell(Text('Year over Year')),
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
