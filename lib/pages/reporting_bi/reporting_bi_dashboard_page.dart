import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class ReportingBiDashboardPage extends StatelessWidget {
  const ReportingBiDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Reporting & BI',
      subtitle:
          'Create reports, explore data and monitor business intelligence.',
      icon: Icons.assessment_outlined,
      kpis: [
        ModuleKpi(
          title: 'Total Reports',
          value: '1,284',
          icon: Icons.description_outlined,
        ),
        ModuleKpi(
          title: 'Scheduled Reports',
          value: '186',
          icon: Icons.schedule_outlined,
        ),
        ModuleKpi(
          title: 'Data Sources',
          value: '42',
          icon: Icons.storage_outlined,
        ),
        ModuleKpi(title: 'BI Users', value: '638', icon: Icons.people_outline),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Standard Reports',
          icon: Icons.description_outlined,
          route: AppRoutes.reportingStandardReports,
        ),
        ModuleQuickAction(
          title: 'Ad-hoc Reports',
          icon: Icons.edit_note_outlined,
          route: AppRoutes.reportingAdHocReports,
        ),
        ModuleQuickAction(
          title: 'Data Exploration',
          icon: Icons.explore_outlined,
          route: AppRoutes.reportingDataExploration,
        ),
        ModuleQuickAction(
          title: 'Data Export',
          icon: Icons.file_download_outlined,
          route: AppRoutes.reportingDataExport,
        ),
        ModuleQuickAction(
          title: 'Scheduled Reports',
          icon: Icons.schedule_outlined,
          route: AppRoutes.reportingScheduledReports,
        ),
        ModuleQuickAction(
          title: 'Data Visualization',
          icon: Icons.bar_chart_outlined,
          route: AppRoutes.reportingDataVisualization,
        ),
        ModuleQuickAction(
          title: 'Self-Service Analytics',
          icon: Icons.insights_outlined,
          route: AppRoutes.reportingSelfServiceAnalytics,
        ),
        ModuleQuickAction(
          title: 'BI Management',
          icon: Icons.dashboard_customize_outlined,
          route: AppRoutes.reportingBiManagement,
        ),
      ],
    );
  }
}
