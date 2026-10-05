import 'package:flutter/material.dart';

class HrmsManagementPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<HrmsKpi> kpis;
  final List<String> columns;
  final List<List<String>> rows;

  const HrmsManagementPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.kpis,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.blue, size: 25),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _showAddDialog(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = 4;

                    if (constraints.maxWidth < 1000) {
                      columns = 2;
                    }

                    if (constraints.maxWidth < 600) {
                      columns = 1;
                    }

                    final width =
                        (constraints.maxWidth - ((columns - 1) * 16)) / columns;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: kpis.map((kpi) {
                        return _KpiCard(width: width, kpi: kpi);
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search $title...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                      label: const Text('Filter'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 35,
                      headingRowColor: WidgetStateProperty.all(
                        Colors.grey.shade50,
                      ),
                      columns: [
                        ...columns.map(
                          (column) => DataColumn(label: Text(column)),
                        ),
                        const DataColumn(label: Text('Action')),
                      ],
                      rows: rows.map((row) {
                        return DataRow(
                          cells: [
                            ...row.map((value) => DataCell(Text(value))),
                            DataCell(
                              IconButton(
                                tooltip: 'View',
                                onPressed: () {
                                  _showDetails(context, row);
                                },
                                icon: const Icon(Icons.visibility_outlined),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add $title'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Name / Title',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title record added successfully.')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDetails(BuildContext context, List<String> row) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: row.map((value) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(value),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}


class HrmsKpi {
  final String title;
  final String value;
  final IconData icon;

  const HrmsKpi({required this.title, required this.value, required this.icon});
}


class _KpiCard extends StatelessWidget {
  final double width;
  final HrmsKpi kpi;

  const _KpiCard({required this.width, required this.kpi});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 105,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(kpi.icon, color: Colors.blue, size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kpi.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  kpi.value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
