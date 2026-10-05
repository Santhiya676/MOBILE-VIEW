import 'package:flutter/material.dart';

class BusinessRulesPage extends StatelessWidget {
  const BusinessRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business Rules')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Business Rules',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Define and manage rules that control business processes.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.rule_outlined),
                title: const Text('High Value Purchase Approval'),
                subtitle: const Text('Purchase amount > \$10,000'),
                trailing: Switch(value: true, onChanged: (_) {}),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.rule_outlined),
                title: const Text('Credit Limit Validation'),
                subtitle: const Text('Validate customer credit before order'),
                trailing: Switch(value: true, onChanged: (_) {}),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.rule_outlined),
                title: const Text('Stock Reorder Rule'),
                subtitle: const Text(
                  'Trigger when stock reaches minimum level',
                ),
                trailing: Switch(value: true, onChanged: (_) {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
