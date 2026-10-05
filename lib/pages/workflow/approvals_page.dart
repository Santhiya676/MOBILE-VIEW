import 'package:flutter/material.dart';

class ApprovalsPage extends StatelessWidget {
  const ApprovalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approvals')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Approvals',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Review and manage pending workflow approvals.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.approval_outlined),
                title: const Text('Purchase Order #PO-1048'),
                subtitle: const Text('Requested by Procurement • \$18,500'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Review'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.approval_outlined),
                title: const Text('Leave Request #LV-208'),
                subtitle: const Text('Employee Leave • 3 days'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Review'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.approval_outlined),
                title: const Text('Invoice #INV-7821'),
                subtitle: const Text('Finance Approval • \$7,250'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Review'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
