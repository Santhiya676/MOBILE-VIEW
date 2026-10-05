import 'package:flutter/material.dart';

class PlatformConfigPage extends StatelessWidget {
  const PlatformConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(
          title: 'Platform Config',
          subtitle: 'Configure core OneCloud platform parameters.',
          icon: Icons.tune_outlined,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _ConfigCard(
                  title: 'Application Configuration',
                  children: const [
                    _ConfigRow(
                      'Application Name',
                      'OneCloud Enterprise Platform',
                    ),
                    _ConfigRow('Environment', 'Development'),
                    _ConfigRow('API Version', 'v1.0'),
                    _ConfigRow('Platform Region', 'India'),
                  ],
                ),
                const SizedBox(height: 20),
                _ConfigCard(
                  title: 'Service Configuration',
                  children: const [
                    _ConfigRow('API Gateway', 'Enabled'),
                    _ConfigRow('Event Streaming', 'Enabled'),
                    _ConfigRow('Notification Service', 'Enabled'),
                    _ConfigRow('Search Service', 'Enabled'),
                  ],
                ),
                const SizedBox(height: 20),
                _ConfigCard(
                  title: 'Configuration Actions',
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_outlined),
                          label: const Text('Edit Configuration'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.refresh_outlined),
                          label: const Text('Reload Configuration'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _Header({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Platform Administration / $title',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfigCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ConfigCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 18),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ConfigRow extends StatelessWidget {
  final String label;
  final String value;

  const _ConfigRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
