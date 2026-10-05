import 'package:flutter/material.dart';

class PipelinePage extends StatelessWidget {
  const PipelinePage({super.key});

  Widget pipelineColumn(String title, String value, List<String> deals) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              ...deals.map(
                (deal) => Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(deal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Pipeline')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Pipeline',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'View and manage opportunities across sales stages.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pipelineColumn('Lead', '\$85,000', [
                    'ABC Technologies',
                    'Prime Solutions',
                  ]),
                  pipelineColumn('Qualified', '\$120,000', [
                    'Smart Industries',
                    'Global Systems',
                  ]),
                  pipelineColumn('Proposal', '\$95,000', [
                    'Future Technologies',
                    'Enterprise Corp',
                  ]),
                  pipelineColumn('Negotiation', '\$65,000', ['Tech Solutions']),
                  pipelineColumn('Won', '\$150,000', [
                    'Digital Systems',
                    'Cloud Corp',
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
