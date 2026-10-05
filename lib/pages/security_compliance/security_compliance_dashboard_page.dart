import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class SecurityComplianceDashboardPage extends StatelessWidget {
  const SecurityComplianceDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Security & Compliance',
      subtitle: 'Manage security monitoring, compliance, policies, encryption and alerts.',
      icon: Icons.security_outlined,
      kpis: [
        ModuleKpi(
          title: 'Security Alerts',
          value: '18',
          icon: Icons.warning_amber_outlined,
        ),
        ModuleKpi(
          title: 'Audit Events',
          value: '842K',
          icon: Icons.fact_check_outlined,
        ),
        ModuleKpi(
          title: 'Compliance Score',
          value: '96%',
          icon: Icons.verified_outlined,
        ),
        ModuleKpi(
          title: 'Vulnerabilities',
          value: '24',
          icon: Icons.bug_report_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Audit Logs',
          icon: Icons.fact_check_outlined,
          route: AppRoutes.securityAuditLogs,
        ),
        ModuleQuickAction(
          title: 'Activity Tracking',
          icon: Icons.track_changes_outlined,
          route: AppRoutes.securityActivityTracking,
        ),
        ModuleQuickAction(
          title: 'Compliance Reports',
          icon: Icons.assignment_outlined,
          route: AppRoutes.securityComplianceReports,
        ),
        ModuleQuickAction(
          title: 'Data Retention',
          icon: Icons.delete_sweep_outlined,
          route: AppRoutes.securityDataRetention,
        ),
        ModuleQuickAction(
          title: 'Policy Management',
          icon: Icons.policy_outlined,
          route: AppRoutes.securityPolicyManagement,
        ),
        ModuleQuickAction(
          title: 'Threat Detection',
          icon: Icons.warning_amber_outlined,
          route: AppRoutes.securityThreatDetection,
        ),
        ModuleQuickAction(
          title: 'Vulnerability Mgmt.',
          icon: Icons.bug_report_outlined,
          route: AppRoutes.securityVulnerabilityManagement,
        ),
        ModuleQuickAction(
          title: 'Encryption & Key Mgmt.',
          icon: Icons.vpn_key_outlined,
          route: AppRoutes.securityEncryptionKeyManagement,
        ),
        ModuleQuickAction(
          title: 'Security Alerts',
          icon: Icons.notifications_active_outlined,
          route: AppRoutes.securityAlerts,
        ),
      ],
    );
  }
}
