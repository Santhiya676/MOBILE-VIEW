import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class EnterpriseAiDashboardPage extends StatelessWidget {
  const EnterpriseAiDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Enterprise AI',
      subtitle:
          'Manage enterprise AI models, copilots, automation and AI insights.',
      icon: Icons.smart_toy_outlined,
      kpis: [
        ModuleKpi(
          title: 'AI Models',
          value: '28',
          icon: Icons.smart_toy_outlined,
        ),
        ModuleKpi(
          title: 'AI Requests',
          value: '184K',
          icon: Icons.auto_awesome_outlined,
        ),
        ModuleKpi(
          title: 'AI Workflows',
          value: '64',
          icon: Icons.account_tree_outlined,
        ),
        ModuleKpi(
          title: 'AI Usage',
          value: '82%',
          icon: Icons.data_usage_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'AI Models',
          icon: Icons.model_training_outlined,
          route: AppRoutes.enterpriseAiModels,
        ),
        ModuleQuickAction(
          title: 'AI Chat / Copilot',
          icon: Icons.chat_outlined,
          route: AppRoutes.enterpriseAiChatCopilot,
        ),
        ModuleQuickAction(
          title: 'Document AI / OCR',
          icon: Icons.document_scanner_outlined,
          route: AppRoutes.enterpriseAiDocumentAiOcr,
        ),
        ModuleQuickAction(
          title: 'Predictive Analytics',
          icon: Icons.trending_up_outlined,
          route: AppRoutes.enterpriseAiPredictiveAnalytics,
        ),
        ModuleQuickAction(
          title: 'Recommendations',
          icon: Icons.recommend_outlined,
          route: AppRoutes.enterpriseAiRecommendations,
        ),
        ModuleQuickAction(
          title: 'AI Workflows',
          icon: Icons.account_tree_outlined,
          route: AppRoutes.enterpriseAiWorkflows,
        ),
        ModuleQuickAction(
          title: 'Model Management',
          icon: Icons.settings_outlined,
          route: AppRoutes.enterpriseAiModelManagement,
        ),
        ModuleQuickAction(
          title: 'Prompt Engineering',
          icon: Icons.code_outlined,
          route: AppRoutes.enterpriseAiPromptEngineering,
        ),
        ModuleQuickAction(
          title: 'AI Usage Logs',
          icon: Icons.history_outlined,
          route: AppRoutes.enterpriseAiUsageLogs,
        ),
      ],
    );
  }
}
