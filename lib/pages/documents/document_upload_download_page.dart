import 'package:flutter/material.dart';

class DocumentUploadDownloadPage extends StatelessWidget {
  const DocumentUploadDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload / Download'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cloud_upload_outlined, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload / Download',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text('Upload new documents and manage document downloads.'),
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
                DataCell(Text('Quarterly Report.pdf')),
                DataCell(Text('Uploaded')),
                DataCell(Text('Today')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Contract_2026.docx')),
                DataCell(Text('Uploaded')),
                DataCell(Text('Yesterday')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Invoice_1042.pdf')),
                DataCell(Text('Downloaded')),
                DataCell(Text('Yesterday')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('Policy_Update.pdf')),
                DataCell(Text('Uploaded')),
                DataCell(Text('08 Sep 2026')),
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
