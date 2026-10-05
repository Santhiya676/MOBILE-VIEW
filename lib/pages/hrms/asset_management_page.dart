import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class HrmsAssetManagementPage extends StatelessWidget {
  const HrmsAssetManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'HRMS Asset Management',
      subtitle: 'Manage assets assigned to employees and workforce teams.',
      icon: Icons.devices_outlined,
      kpis: [
        HrmsKpi(
          title: 'Total Assets',
          value: '312',
          icon: Icons.inventory_2_outlined,
        ),
        HrmsKpi(
          title: 'Assigned',
          value: '268',
          icon: Icons.assignment_ind_outlined,
        ),
        HrmsKpi(
          title: 'Available',
          value: '44',
          icon: Icons.check_circle_outline,
        ),
        HrmsKpi(title: 'Maintenance', value: '12', icon: Icons.build_outlined),
      ],
      columns: ['Asset ID', 'Asset', 'Assigned To', 'Department', 'Status'],
      rows: [
        ['AST001', 'Dell Laptop', 'Rahul Sharma', 'IT', 'Assigned'],
        ['AST002', 'MacBook Pro', 'Priya Reddy', 'HR', 'Assigned'],
        ['AST003', 'Monitor', 'Arjun Kumar', 'Finance', 'Assigned'],
        ['AST004', 'Laptop', 'Sneha Rao', 'Sales', 'Maintenance'],
        ['AST005', 'Mobile Phone', 'Vikram Singh', 'Operations', 'Assigned'],
      ],
    );
  }
}
