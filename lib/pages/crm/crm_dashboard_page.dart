import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class CrmDashboardPage extends StatelessWidget {
  const CrmDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'CRM',
      subtitle: 'Manage customers, leads, opportunities and relationships.',
      icon: Icons.handshake_outlined,

      kpis: [
        ModuleKpi(
          title: 'Leads',
          value: '328',
          icon: Icons.person_search_outlined,
        ),
        ModuleKpi(
          title: 'Opportunities',
          value: '96',
          icon: Icons.trending_up_outlined,
        ),
        ModuleKpi(
          title: 'Accounts',
          value: '214',
          icon: Icons.business_outlined,
        ),
        ModuleKpi(
          title: 'Activities',
          value: '1,482',
          icon: Icons.task_alt_outlined,
        ),
      ],

      quickActions: [
        ModuleQuickAction(
          title: 'Leads',
          icon: Icons.person_search_outlined,
          route: AppRoutes.crmLeads,
        ),
        ModuleQuickAction(
          title: 'Opportunities',
          icon: Icons.trending_up_outlined,
          route: AppRoutes.crmOpportunities,
        ),
        ModuleQuickAction(
          title: 'Accounts',
          icon: Icons.business_outlined,
          route: AppRoutes.crmAccounts,
        ),
        ModuleQuickAction(
          title: 'Contacts',
          icon: Icons.contacts_outlined,
          route: AppRoutes.crmContacts,
        ),
        ModuleQuickAction(
          title: 'Activities',
          icon: Icons.task_alt_outlined,
          route: AppRoutes.crmActivities,
        ),
        ModuleQuickAction(
          title: 'Sales Pipeline',
          icon: Icons.filter_alt_outlined,
          route: AppRoutes.crmPipeline,
        ),
        ModuleQuickAction(
          title: 'Quotations',
          icon: Icons.request_quote_outlined,
          route: AppRoutes.crmQuotations,
        ),
        ModuleQuickAction(
          title: 'Campaigns',
          icon: Icons.campaign_outlined,
          route: AppRoutes.crmCampaigns,
        ),
        ModuleQuickAction(
          title: 'Customer Support',
          icon: Icons.support_agent_outlined,
          route: AppRoutes.crmCustomerSupport,
        ),
      ],
    );
  }
}
