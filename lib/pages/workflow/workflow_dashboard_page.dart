import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class WorkflowDashboardPage extends StatelessWidget {
  const WorkflowDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Workflow & Automation',
      subtitle: 'Design workflows, approvals and automated business processes.',
      icon: Icons.account_tree_outlined,
      kpis: [
        ModuleKpi(
          title: 'Active Workflows',
          value: '32',
          icon: Icons.account_tree_outlined,
        ),
        ModuleKpi(
          title: 'Pending Approvals',
          value: '18',
          icon: Icons.pending_actions_outlined,
        ),
        ModuleKpi(
          title: 'Running Tasks',
          value: '64',
          icon: Icons.play_circle_outline,
        ),
        ModuleKpi(
          title: 'Completed',
          value: '1,248',
          icon: Icons.check_circle_outline,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Workflow Builder',
          icon: Icons.account_tree_outlined,
          route: AppRoutes.workflowBuilder,
        ),
        ModuleQuickAction(
          title: 'Approvals',
          icon: Icons.approval_outlined,
          route: AppRoutes.workflowApprovals,
        ),
        ModuleQuickAction(
          title: 'Business Rules',
          icon: Icons.rule_outlined,
          route: AppRoutes.workflowBusinessRules,
        ),
        ModuleQuickAction(
          title: 'Process Automation',
          icon: Icons.auto_fix_high_outlined,
          route: AppRoutes.workflowProcessAutomation,
        ),
        ModuleQuickAction(
          title: 'Task Management',
          icon: Icons.task_alt_outlined,
          route: AppRoutes.workflowTasks,
        ),
        ModuleQuickAction(
          title: 'Triggers',
          icon: Icons.flash_on_outlined,
          route: AppRoutes.workflowTriggers,
        ),
        ModuleQuickAction(
          title: 'SLAs & Escalations',
          icon: Icons.timer_outlined,
          route: AppRoutes.workflowSlas,
        ),
        ModuleQuickAction(
          title: 'Process Monitoring',
          icon: Icons.monitor_outlined,
          route: AppRoutes.workflowMonitoring,
        ),
        ModuleQuickAction(
          title: 'Workflow Templates',
          icon: Icons.description_outlined,
          route: AppRoutes.workflowTemplates,
        ),
      ],
    );
  }
}
