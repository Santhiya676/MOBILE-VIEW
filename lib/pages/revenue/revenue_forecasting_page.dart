import 'package:flutter/material.dart';

class RevenueForecastingPage extends StatelessWidget {
  const RevenueForecastingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecasting'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.insights_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forecasting',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('View projected revenue and forecast performance.'),
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
                DataCell(Text('Q3 Forecast')),
                DataCell(Text('₹7.8 Cr')),
                DataCell(Text('Confidence: 92%')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Q4 Forecast')),
                DataCell(Text('₹8.6 Cr')),
                DataCell(Text('Confidence: 86%')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Annual Forecast')),
                DataCell(Text('₹31.4 Cr')),
                DataCell(Text('Confidence: 89%')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Growth Projection')),
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
