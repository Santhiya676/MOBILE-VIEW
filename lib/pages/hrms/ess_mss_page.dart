import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class EssMssPage extends StatelessWidget {
  const EssMssPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'ESS / MSS',
      subtitle: 'Manage employee and manager self-service activities.',
      icon: Icons.manage_accounts_outlined,
      kpis: [
        HrmsKpi(
          title: 'Employee Users',
          value: '231',
          icon: Icons.person_outline,
        ),
        HrmsKpi(
          title: 'Managers',
          value: '38',
          icon: Icons.supervisor_account_outlined,
        ),
        HrmsKpi(
          title: 'Pending Actions',
          value: '16',
          icon: Icons.pending_actions_outlined,
        ),
        HrmsKpi(
          title: 'Requests Today',
          value: '27',
          icon: Icons.request_page_outlined,
        ),
      ],
      columns: ['User', 'Role', 'Request', 'Submitted', 'Status'],
      rows: [
        ['Rahul Sharma', 'Employee', 'Leave Request', '10 Sep', 'Pending'],
        ['Priya Reddy', 'Manager', 'Leave Approval', '10 Sep', 'Approved'],
        ['Arjun Kumar', 'Employee', 'Profile Update', '09 Sep', 'Completed'],
        ['Sneha Rao', 'Employee', 'Attendance Correction', '09 Sep', 'Pending'],
        ['Vikram Singh', 'Manager', 'Team Approval', '08 Sep', 'Completed'],
      ],
    );
  }
}
