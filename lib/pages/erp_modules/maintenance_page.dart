import 'package:flutter/material.dart';

import '../../app_theme.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  static const List<Map<String, dynamic>> _workOrders = [
    {
      'id': 'MWO-2001',
      'asset': 'CNC Machine 01',
      'type': 'Preventive',
      'priority': 'Medium',
      'technician': 'Maintenance Team A',
      'status': 'In Progress',
      'due': '10 Sep 2026',
    },
    {
      'id': 'MWO-2002',
      'asset': 'Generator G-05',
      'type': 'Corrective',
      'priority': 'High',
      'technician': 'Maintenance Team B',
      'status': 'Open',
      'due': '11 Sep 2026',
    },
    {
      'id': 'MWO-2003',
      'asset': 'Packaging Line P-02',
      'type': 'Preventive',
      'priority': 'Low',
      'technician': 'Maintenance Team A',
      'status': 'Scheduled',
      'due': '14 Sep 2026',
    },
    {
      'id': 'MWO-2004',
      'asset': 'Forklift FL-12',
      'type': 'Inspection',
      'priority': 'Medium',
      'technician': 'Maintenance Team C',
      'status': 'Completed',
      'due': '09 Sep 2026',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 700;
            return SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(context, isMobile),
                  const SizedBox(height: 24),
                  _kpis(isMobile),
                  const SizedBox(height: 24),
                  const Text(
                    'Maintenance Work Orders',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.darkNavy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _workOrderList(isMobile),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _header(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maintenance',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 30,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Schedule preventive maintenance and manage maintenance work orders.',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
        ),
        if (!isMobile)
          ElevatedButton.icon(
            onPressed: () => _message(
              context,
              'Create Work Order action is ready for backend integration.',
            ),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Work Order'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            ),
          ),
      ],
    );
  }

  Widget _kpis(bool isMobile) {
    final data = [
      ['Open Work Orders', '24', Icons.assignment_outlined],
      ['Due Today', '5', Icons.today_outlined],
      ['Preventive Tasks', '38', Icons.event_repeat_outlined],
      ['Completed This Month', '142', Icons.task_alt_outlined],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.45 : 2.1,
      ),
      itemBuilder: (context, index) {
        return _kpi(
          data[index][0] as String,
          data[index][1] as String,
          data[index][2] as IconData,
        );
      },
    );
  }

  Widget _kpi(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _card(),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryBlue, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
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

  Widget _workOrderList(bool isMobile) {
    if (isMobile) {
      return Column(
        children: _workOrders.map((order) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: _card(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${order['id']} • ${order['asset']}',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    _status(order['status'] as String),
                  ],
                ),
                const SizedBox(height: 9),
                Text('${order['type']} • ${order['priority']} priority'),
                const SizedBox(height: 5),
                Text('${order['technician']} • Due ${order['due']}'),
              ],
            ),
          );
        }).toList(),
      );
    }

    return Container(
      width: double.infinity,
      decoration: _card(),
      child: DataTable(
        columnSpacing: 28,
        headingRowColor: WidgetStatePropertyAll(
          AppTheme.primaryBlue.withValues(alpha: 0.05),
        ),
        columns: const [
          DataColumn(label: Text('Work Order')),
          DataColumn(label: Text('Asset')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Priority')),
          DataColumn(label: Text('Technician')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Due')),
        ],
        rows: _workOrders.map((order) {
          return DataRow(
            cells: [
              DataCell(Text(order['id'] as String)),
              DataCell(Text(order['asset'] as String)),
              DataCell(Text(order['type'] as String)),
              DataCell(_priority(order['priority'] as String)),
              DataCell(Text(order['technician'] as String)),
              DataCell(_status(order['status'] as String)),
              DataCell(Text(order['due'] as String)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _priority(String value) {
    final color = value == 'High'
        ? Colors.red
        : value == 'Medium'
        ? Colors.orange
        : Colors.green;

    return Text(
      value,
      style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
    );
  }

  Widget _status(String value) {
    final color = value == 'Completed'
        ? Colors.green
        : value == 'In Progress'
        ? Colors.orange
        : value == 'Open'
        ? Colors.red
        : Colors.blueGrey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  BoxDecoration _card() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static void _message(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
