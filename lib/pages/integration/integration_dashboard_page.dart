import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class IntegrationDashboardPage extends StatelessWidget {
  const IntegrationDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Integration',
      subtitle: 'Manage APIs, connectors, events, data synchronization and integrations.',
      icon: Icons.integration_instructions_outlined,
      kpis: [
        ModuleKpi(
          title: 'Active Integrations',
          value: '186',
          icon: Icons.integration_instructions_outlined,
        ),
        ModuleKpi(
          title: 'API Requests',
          value: '2.4M',
          icon: Icons.api_outlined,
        ),
        ModuleKpi(title: 'Sync Jobs', value: '842', icon: Icons.sync_outlined),
        ModuleKpi(
          title: 'Integration Errors',
          value: '126',
          icon: Icons.error_outline,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'API Management',
          icon: Icons.api_outlined,
          route: AppRoutes.integrationApiManagement,
        ),
        ModuleQuickAction(
          title: 'Third-Party Integrations',
          icon: Icons.extension_outlined,
          route: AppRoutes.integrationThirdPartyIntegrations,
        ),
        ModuleQuickAction(
          title: 'Webhooks',
          icon: Icons.link_outlined,
          route: AppRoutes.integrationWebhooks,
        ),
        ModuleQuickAction(
          title: 'Event Streaming',
          icon: Icons.stream_outlined,
          route: AppRoutes.integrationEventStreaming,
        ),
        ModuleQuickAction(
          title: 'Data Transformation',
          icon: Icons.transform_outlined,
          route: AppRoutes.integrationDataTransformation,
        ),
        ModuleQuickAction(
          title: 'ETL / Data Sync',
          icon: Icons.sync_alt_outlined,
          route: AppRoutes.integrationEtlDataSync,
        ),
        ModuleQuickAction(
          title: 'Connectors (ERP, Banking, etc.)',
          icon: Icons.cable_outlined,
          route: AppRoutes.integrationConnectors,
        ),
        ModuleQuickAction(
          title: 'Integration Logs',
          icon: Icons.list_alt_outlined,
          route: AppRoutes.integrationLogs,
        ),
      ],
    );
  }
}
