import 'package:flutter/material.dart';

class ResourceManagementPage extends StatelessWidget {
  const ResourceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final resources = [
      ['API Services', '42', 'Healthy'],
      ['Compute Resources', '18', 'Healthy'],
      ['Storage', '2.4 TB', 'Normal'],
      ['Database Instances', '12', 'Healthy'],
    ];

    return Column(
      children: [
        _Header(
          title: 'Resource Management',
          subtitle: 'Monitor and manage platform resources.',
          icon: Icons.dns_outlined,
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
                      'Platform Resources',
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 18),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Resource')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: resources.map((resource) {
                          return DataRow(
                            cells: [
                              DataCell(Text(resource[0])),
                              DataCell(Text(resource[1])),
                              DataCell(
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 9,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(resource[2]),
                                  ],
                                ),
                              ),
                              DataCell(
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.visibility_outlined),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
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
