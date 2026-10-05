import 'package:flutter/material.dart';

class FeatureManagementPage extends StatefulWidget {
  const FeatureManagementPage({super.key});

  @override
  State<FeatureManagementPage> createState() => _FeatureManagementPageState();
}

class _FeatureManagementPageState extends State<FeatureManagementPage> {
  final features = <String, bool>{
    'Inventory Management': true,
    'CRM': true,
    'HRMS': true,
    'Finance & Accounting': true,
    'Enterprise AI': false,
    'Advanced Reporting': true,
    'Workflow Automation': true,
    'Document Management': true,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(
          title: 'Feature Management',
          subtitle: 'Enable and control platform features.',
          icon: Icons.extension_outlined,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Platform Features',
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Control which enterprise features are available.',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 20),
                    ...features.entries.map(
                      (entry) => SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        value: entry.value,
                        onChanged: (value) {
                          setState(() {
                            features[entry.key] = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save_outlined),
                      label: const Text('Save Features'),
                    ),
                  ],
                ),
              ),
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
          Icon(icon, color: Colors.blue, size: 32),
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
