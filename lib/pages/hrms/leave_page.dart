import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'Leave Management',
      subtitle: 'Manage employee leave requests and approvals.',
      icon: Icons.event_busy_outlined,
      kpis: [
        HrmsKpi(
          title: 'Total Requests',
          value: '38',
          icon: Icons.list_alt_outlined,
        ),
        HrmsKpi(
          title: 'Pending',
          value: '9',
          icon: Icons.pending_actions_outlined,
        ),
        HrmsKpi(
          title: 'Approved',
          value: '25',
          icon: Icons.check_circle_outline,
        ),
        HrmsKpi(title: 'Rejected', value: '4', icon: Icons.cancel_outlined),
      ],
      columns: ['Employee', 'Leave Type', 'From', 'To', 'Status'],
      rows: [
        ['Sneha Rao', 'Annual Leave', '10 Sep', '12 Sep', 'Approved'],
        ['Arjun Kumar', 'Sick Leave', '11 Sep', '11 Sep', 'Pending'],
        ['Rahul Sharma', 'Casual Leave', '15 Sep', '16 Sep', 'Approved'],
        ['Priya Reddy', 'Annual Leave', '18 Sep', '20 Sep', 'Pending'],
        ['Vikram Singh', 'Casual Leave', '22 Sep', '22 Sep', 'Rejected'],
      ],
    );
  }
}
