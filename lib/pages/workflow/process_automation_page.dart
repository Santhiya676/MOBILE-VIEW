import 'package:flutter/material.dart';

class ProcessAutomationPage extends StatelessWidget {
  const ProcessAutomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Process Automation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Process Automation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Automate repetitive business processes and tasks.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.auto_awesome_outlined),
                title: const Text('Purchase Order Automation'),
                subtitle: const Text(
                  'Automatically route purchase orders for approval',
                ),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.auto_awesome_outlined),
                title: const Text('Invoice Processing'),
                subtitle: const Text('Automatically process incoming invoices'),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.auto_awesome_outlined),
                title: const Text('Employee Onboarding'),
                subtitle: const Text(
                  'Automate onboarding tasks and notifications',
                ),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
