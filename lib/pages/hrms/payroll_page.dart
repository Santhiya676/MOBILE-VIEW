import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'Payroll',
      subtitle: 'Manage employee salaries, payroll processing and payments.',
      icon: Icons.payments_outlined,
      kpis: [
        HrmsKpi(
          title: 'Monthly Payroll',
          value: '₹42.8L',
          icon: Icons.account_balance_wallet_outlined,
        ),
        HrmsKpi(title: 'Employees', value: '248', icon: Icons.people_outline),
        HrmsKpi(
          title: 'Processed',
          value: '231',
          icon: Icons.check_circle_outline,
        ),
        HrmsKpi(title: 'Pending', value: '17', icon: Icons.pending_outlined),
      ],
      columns: [
        'Employee',
        'Department',
        'Gross Salary',
        'Deductions',
        'Net Salary',
      ],
      rows: [
        ['Rahul Sharma', 'IT', '₹85,000', '₹8,500', '₹76,500'],
        ['Priya Reddy', 'HR', '₹92,000', '₹9,200', '₹82,800'],
        ['Arjun Kumar', 'Finance', '₹65,000', '₹6,500', '₹58,500'],
        ['Sneha Rao', 'Sales', '₹58,000', '₹5,800', '₹52,200'],
        ['Vikram Singh', 'Operations', '₹78,000', '₹7,800', '₹70,200'],
      ],
    );
  }
}
