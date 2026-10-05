import 'package:flutter/material.dart';

class ProcessMonitoringPage extends StatelessWidget {
  const ProcessMonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Process Monitoring')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Process Monitoring',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Monitor workflow execution and process status.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.monitor_outlined),
                title: const Text('Purchase Approval Workflow'),
                subtitle: const Text('Running • Step 4 of 6'),
                trailing: const Text('Running'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.monitor_outlined),
                title: const Text('Invoice Processing'),
                subtitle: const Text('Completed • 18 minutes ago'),
                trailing: const Text('Completed'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.monitor_outlined),
                title: const Text('Employee Onboarding'),
                subtitle: const Text('Waiting for HR approval'),
                trailing: const Text('Waiting'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
