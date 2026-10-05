import 'package:flutter/material.dart';

class SlasEscalationsPage extends StatelessWidget {
  const SlasEscalationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SLAs & Escalations')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SLAs & Escalations',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage service levels, deadlines and escalation rules.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('Purchase Approval SLA'),
                subtitle: const Text('Target: 24 hours'),
                trailing: const Text('Active'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('Invoice Approval SLA'),
                subtitle: const Text('Target: 12 hours'),
                trailing: const Text('Active'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('Support Escalation'),
                subtitle: const Text('Escalate after 48 hours'),
                trailing: const Text('Active'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
