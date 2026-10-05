import 'package:flutter/material.dart';

class TriggersPage extends StatelessWidget {
  const TriggersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Triggers')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Triggers',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Configure events that start workflows and automated processes.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.flash_on_outlined),
                title: const Text('Purchase Order Created'),
                subtitle: const Text('Starts Purchase Approval Workflow'),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.flash_on_outlined),
                title: const Text('Invoice Received'),
                subtitle: const Text('Starts Invoice Processing Workflow'),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.flash_on_outlined),
                title: const Text('Stock Below Minimum'),
                subtitle: const Text('Starts Reorder Process'),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
