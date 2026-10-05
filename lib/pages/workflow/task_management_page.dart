import 'package:flutter/material.dart';

class TaskManagementPage extends StatelessWidget {
  const TaskManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Management')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task Management',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track and manage workflow tasks.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task_outlined),
                title: const Text('Review Purchase Order'),
                subtitle: const Text('Assigned to Procurement Manager'),
                trailing: const Text('Pending'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task_outlined),
                title: const Text('Approve Invoice'),
                subtitle: const Text('Assigned to Finance Manager'),
                trailing: const Text('Pending'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task_outlined),
                title: const Text('Complete Employee Onboarding'),
                subtitle: const Text('Assigned to HR'),
                trailing: const Text('In Progress'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
