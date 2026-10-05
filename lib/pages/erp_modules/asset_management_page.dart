import 'package:flutter/material.dart';

import '../../app_theme.dart';

class AssetManagementPage extends StatelessWidget {
  const AssetManagementPage({super.key});

  static const List<Map<String, dynamic>> _assets = [
    {
      'id': 'AST-001',
      'name': 'CNC Machine 01',
      'category': 'Production Equipment',
      'location': 'Plant A',
      'value': '₹18.5L',
      'status': 'Operational',
    },
    {
      'id': 'AST-002',
      'name': 'Forklift FL-12',
      'category': 'Material Handling',
      'location': 'Warehouse 01',
      'value': '₹8.2L',
      'status': 'Operational',
    },
    {
      'id': 'AST-003',
      'name': 'Generator G-05',
      'category': 'Utilities',
      'location': 'Plant B',
      'value': '₹12.4L',
      'status': 'Maintenance',
    },
    {
      'id': 'AST-004',
      'name': 'Packaging Line P-02',
      'category': 'Production Equipment',
      'location': 'Plant A',
      'value': '₹24.8L',
      'status': 'Operational',
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
                  Text(
                    'Asset Register',
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.darkNavy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _assetList(isMobile),
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
                'Asset Management',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 30,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Manage enterprise assets, locations, values and lifecycle status.',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
        ),
        if (!isMobile)
          ElevatedButton.icon(
            onPressed: () => _message(
              context,
              'Add Asset action is ready for backend integration.',
            ),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add Asset'),
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
      ['Total Assets', '486', Icons.inventory_2_outlined],
      ['Operational', '442', Icons.check_circle_outline],
      ['Under Maintenance', '18', Icons.build_outlined],
      ['Total Asset Value', '₹18.6Cr', Icons.currency_rupee],
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

  Widget _assetList(bool isMobile) {
    if (isMobile) {
      return Column(
        children: _assets.map((asset) {
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
                        asset['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    _status(asset['status'] as String),
                  ],
                ),
                const SizedBox(height: 8),
                Text('${asset['id']} • ${asset['category']}'),
                const SizedBox(height: 5),
                Text('${asset['location']} • ${asset['value']}'),
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
        columnSpacing: 34,
        headingRowColor: WidgetStatePropertyAll(
          AppTheme.primaryBlue.withValues(alpha: 0.05),
        ),
        columns: const [
          DataColumn(label: Text('Asset ID')),
          DataColumn(label: Text('Asset')),
          DataColumn(label: Text('Category')),
          DataColumn(label: Text('Location')),
          DataColumn(label: Text('Value')),
          DataColumn(label: Text('Status')),
        ],
        rows: _assets.map((asset) {
          return DataRow(
            cells: [
              DataCell(Text(asset['id'] as String)),
              DataCell(Text(asset['name'] as String)),
              DataCell(Text(asset['category'] as String)),
              DataCell(Text(asset['location'] as String)),
              DataCell(Text(asset['value'] as String)),
              DataCell(_status(asset['status'] as String)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _status(String value) {
    final maintenance = value == 'Maintenance';
    final color = maintenance ? Colors.orange : Colors.green;
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
