import 'package:flutter/material.dart';

class DocumentOcrIntegrationPage extends StatelessWidget {
  const DocumentOcrIntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR Integration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.document_scanner_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OCR Integration',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Process scanned documents and extract searchable text.'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
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
                DataCell(Text('Invoice_1042.pdf')),
                DataCell(Text('Processed')),
                DataCell(Text('98% confidence')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contract_Scan.pdf')),
                DataCell(Text('Processed')),
                DataCell(Text('96% confidence')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Receipt_221.jpg')),
                DataCell(Text('Processing')),
                DataCell(Text('Queued')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('ID_Document.png')),
                DataCell(Text('Completed')),
                DataCell(Text('99% confidence')),
              ],
            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
