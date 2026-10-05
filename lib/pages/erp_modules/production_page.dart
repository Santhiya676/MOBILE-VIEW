import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ProductionPage extends StatefulWidget {
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  final List<Map<String, dynamic>> _orders = [
    {
      'id': 'MO-1001',
      'product': 'Industrial Pump X200',
      'planned': 120,
      'produced': 96,
      'status': 'In Progress',
      'date': '10 Sep 2026',
    },
    {
      'id': 'MO-1002',
      'product': 'Control Panel C50',
      'planned': 80,
      'produced': 80,
      'status': 'Completed',
      'date': '09 Sep 2026',
    },
    {
      'id': 'MO-1003',
      'product': 'Hydraulic Valve V10',
      'planned': 150,
      'produced': 75,
      'status': 'In Progress',
      'date': '08 Sep 2026',
    },
    {
      'id': 'MO-1004',
      'product': 'Motor Assembly M40',
      'planned': 60,
      'produced': 0,
      'status': 'Planned',
      'date': '12 Sep 2026',
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
                  _header(isMobile),
                  const SizedBox(height: 24),
                  _kpis(isMobile),
                  const SizedBox(height: 24),
                  _sectionTitle('Production Orders'),
                  const SizedBox(height: 12),
                  _orderTable(isMobile),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _header(bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Production',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 30,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Plan, track and manage production operations.',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
        ),
        if (!isMobile)
          ElevatedButton.icon(
            onPressed: _showCreateOrder,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Create Production Order'),
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
    final items = [
      ['Active Orders', '12', Icons.assignment],
      ['Units in Production', '1,248', Icons.precision_manufacturing],
      ['Completed Today', '386', Icons.check_circle],
      ['Efficiency', '94.6%', Icons.trending_up],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 1.45 : 2.1,
      ),
      itemBuilder: (context, index) {
        return _kpiCard(
          items[index][0] as String,
          items[index][1] as String,
          items[index][2] as IconData,
        );
      },
    );
  }

  Widget _kpiCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryBlue),
          ),
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
                    fontSize: 21,
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

  Widget _orderTable(bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: _cardDecoration(),
      child: isMobile
          ? Column(children: _orders.map(_mobileOrderCard).toList())
          : DataTable(
              columnSpacing: 28,
              headingRowColor: WidgetStatePropertyAll(
                AppTheme.primaryBlue.withValues(alpha: 0.05),
              ),
              columns: const [
                DataColumn(label: Text('Order')),
                DataColumn(label: Text('Product')),
                DataColumn(label: Text('Planned')),
                DataColumn(label: Text('Produced')),
                DataColumn(label: Text('Progress')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Date')),
              ],
              rows: _orders.map((order) {
                final progress =
                    (order['produced'] as int) / (order['planned'] as int);
                return DataRow(
                  cells: [
                    DataCell(Text(order['id'] as String)),
                    DataCell(Text(order['product'] as String)),
                    DataCell(Text('${order['planned']}')),
                    DataCell(Text('${order['produced']}')),
                    DataCell(
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 7,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    DataCell(_status(order['status'] as String)),
                    DataCell(Text(order['date'] as String)),
                  ],
                );
              }).toList(),
            ),
    );
  }

  Widget _mobileOrderCard(Map<String, dynamic> order) {
    final progress = (order['produced'] as int) / (order['planned'] as int);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        '${order['id']} • ${order['product']}',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order['produced']} / ${order['planned']} units'),
            const SizedBox(height: 7),
            LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
      trailing: _status(order['status'] as String),
    );
  }

  Widget _status(String value) {
    final isComplete = value == 'Completed';
    final isProgress = value == 'In Progress';
    final color = isComplete
        ? Colors.green
        : isProgress
        ? Colors.orange
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: AppTheme.darkNavy,
      ),
    );
  }

  BoxDecoration _cardDecoration() {
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

  void _showCreateOrder() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Create Production Order action is ready for backend integration.',
        ),
      ),
    );
  }
}
