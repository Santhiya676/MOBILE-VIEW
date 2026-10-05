import 'package:flutter/material.dart';

class WorkflowTemplatesPage extends StatelessWidget {
  const WorkflowTemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workflow Templates')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Workflow Templates',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use predefined templates to quickly create workflows.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined),
                title: const Text('Purchase Approval'),
                subtitle: const Text('Standard purchase approval workflow'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Use'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined),
                title: const Text('Invoice Approval'),
                subtitle: const Text('Finance invoice approval workflow'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Use'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined),
                title: const Text('Employee Onboarding'),
                subtitle: const Text('Standard employee onboarding workflow'),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Use'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
