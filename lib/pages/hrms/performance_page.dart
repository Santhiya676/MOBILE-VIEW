import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class PerformancePage extends StatelessWidget {
  const PerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'Performance',
      subtitle: 'Track employee goals, reviews and performance evaluations.',
      icon: Icons.trending_up_outlined,
      kpis: [
        HrmsKpi(
          title: 'Reviews Due',
          value: '24',
          icon: Icons.rate_review_outlined,
        ),
        HrmsKpi(
          title: 'Completed',
          value: '182',
          icon: Icons.check_circle_outline,
        ),
        HrmsKpi(
          title: 'Average Rating',
          value: '4.2',
          icon: Icons.star_outline,
        ),
        HrmsKpi(title: 'Goals', value: '326', icon: Icons.flag_outlined),
      ],
      columns: ['Employee', 'Department', 'Review Period', 'Rating', 'Status'],
      rows: [
        ['Rahul Sharma', 'IT', 'Q3 2026', '4.5', 'Completed'],
        ['Priya Reddy', 'HR', 'Q3 2026', '4.3', 'Completed'],
        ['Arjun Kumar', 'Finance', 'Q3 2026', '4.0', 'In Progress'],
        ['Sneha Rao', 'Sales', 'Q3 2026', '4.1', 'Completed'],
        ['Vikram Singh', 'Operations', 'Q3 2026', '4.4', 'Pending'],
      ],
    );
  }
}
