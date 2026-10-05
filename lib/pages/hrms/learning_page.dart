import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'Learning',
      subtitle: 'Manage employee training, courses and learning programs.',
      icon: Icons.school_outlined,
      kpis: [
        HrmsKpi(
          title: 'Active Courses',
          value: '24',
          icon: Icons.menu_book_outlined,
        ),
        HrmsKpi(title: 'Enrolled', value: '186', icon: Icons.people_outline),
        HrmsKpi(
          title: 'Completed',
          value: '142',
          icon: Icons.check_circle_outline,
        ),
        HrmsKpi(
          title: 'Certificates',
          value: '96',
          icon: Icons.workspace_premium_outlined,
        ),
      ],
      columns: ['Course', 'Category', 'Employees', 'Completion', 'Status'],
      rows: [
        ['Flutter Development', 'Technical', '42', '86%', 'Active'],
        ['Leadership Skills', 'Management', '28', '72%', 'Active'],
        ['Workplace Safety', 'Compliance', '65', '100%', 'Completed'],
        ['Data Analytics', 'Technical', '31', '64%', 'Active'],
        ['Communication Skills', 'Soft Skills', '20', '91%', 'Active'],
      ],
    );
  }
}
