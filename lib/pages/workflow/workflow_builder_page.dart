import 'package:flutter/material.dart';

class WorkflowBuilderPage extends StatelessWidget {
  const WorkflowBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workflow Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Workflow Builder',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create and manage business workflows.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_tree_outlined),
                title: const Text('Purchase Approval Workflow'),
                subtitle: const Text('Active • 6 steps'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_tree_outlined),
                title: const Text('Leave Approval Workflow'),
                subtitle: const Text('Active • 4 steps'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_tree_outlined),
                title: const Text('Invoice Approval Workflow'),
                subtitle: const Text('Draft • 5 steps'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}