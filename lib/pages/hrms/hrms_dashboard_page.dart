import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class HrmsDashboardPage extends StatelessWidget {
  const HrmsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'HRMS',
      subtitle: 'Manage employees, workforce operations and HR processes.',
      icon: Icons.people_alt_outlined,

      kpis: [
        ModuleKpi(title: 'Employees', value: '486', icon: Icons.people_outline),
        ModuleKpi(
          title: 'Present Today',
          value: '452',
          icon: Icons.how_to_reg_outlined,
        ),
        ModuleKpi(
          title: 'On Leave',
          value: '18',
          icon: Icons.event_busy_outlined,
        ),
        ModuleKpi(
          title: 'Open Positions',
          value: '12',
          icon: Icons.work_outline,
        ),
      ],

      quickActions: [
        ModuleQuickAction(
          title: 'Employee Management',
          icon: Icons.people_outline,
          route: AppRoutes.hrmsEmployees,
        ),
        ModuleQuickAction(
          title: 'Attendance',
          icon: Icons.access_time_outlined,
          route: AppRoutes.hrmsAttendance,
        ),
        ModuleQuickAction(
          title: 'Leave Management',
          icon: Icons.event_available_outlined,
          route: AppRoutes.hrmsLeave,
        ),
        ModuleQuickAction(
          title: 'Payroll',
          icon: Icons.payments_outlined,
          route: AppRoutes.hrmsPayroll,
        ),
        ModuleQuickAction(
          title: 'Recruitment',
          icon: Icons.person_search_outlined,
          route: AppRoutes.hrmsRecruitment,
        ),
        ModuleQuickAction(
          title: 'Performance',
          icon: Icons.trending_up_outlined,
          route: AppRoutes.hrmsPerformance,
        ),
        ModuleQuickAction(
          title: 'Learning',
          icon: Icons.school_outlined,
          route: AppRoutes.hrmsLearning,
        ),
        ModuleQuickAction(
          title: 'ESS / MSS',
          icon: Icons.manage_accounts_outlined,
          route: AppRoutes.hrmsEssMss,
        ),
        ModuleQuickAction(
          title: 'Asset Management',
          icon: Icons.inventory_2_outlined,
          route: AppRoutes.hrmsAssets,
        ),
      ],
    );
  }
}
