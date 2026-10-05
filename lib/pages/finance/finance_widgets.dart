import 'package:flutter/material.dart';

class FinancePageShell extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Widget child;

  const FinancePageShell({
    super.key,
    required this.title,
    required this.subtitle,
    this.actions = const [],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        actions: actions,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 24),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class FinanceStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const FinanceStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FinanceSectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const FinanceSectionCard({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class FinanceTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  const FinanceTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade100),
        columns: [
          for (final column in columns)
            DataColumn(
              label: Text(
                column,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
        ],
        rows: [
          for (final row in rows)
            DataRow(
              cells: [
                for (final value in row) DataCell(Text(value)),
              ],
            ),
        ],
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String label;

  const StatusChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    final lower = label.toLowerCase();
    final Color bg = lower.contains('paid') ||
            lower.contains('active') ||
            lower.contains('matched') ||
            lower.contains('approved') ||
            lower.contains('closed')
        ? Colors.green.shade100
        : lower.contains('pending') ||
                lower.contains('draft') ||
                lower.contains('partial')
            ? Colors.orange.shade100
            : lower.contains('overdue') ||
                    lower.contains('failed') ||
                    lower.contains('unmatched')
                ? Colors.red.shade100
                : Colors.blue.shade100;

    final Color fg = lower.contains('paid') ||
            lower.contains('active') ||
            lower.contains('matched') ||
            lower.contains('approved') ||
            lower.contains('closed')
        ? Colors.green.shade800
        : lower.contains('pending') ||
                lower.contains('draft') ||
                lower.contains('partial')
            ? Colors.orange.shade800
            : lower.contains('overdue') ||
                    lower.contains('failed') ||
                    lower.contains('unmatched')
                ? Colors.red.shade800
                : Colors.blue.shade800;

    return Chip(
      label: Text(label),
      backgroundColor: bg,
      labelStyle: TextStyle(color: fg, fontSize: 12),
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}
