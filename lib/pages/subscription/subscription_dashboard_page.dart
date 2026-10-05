import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class SubscriptionDashboardPage extends StatelessWidget {
  const SubscriptionDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Subscription Management',
      subtitle:
          'Manage plans, tenant subscriptions, usage, licensing and billing.',
      icon: Icons.card_membership_outlined,
      kpis: [
        ModuleKpi(
          title: 'Active Subscriptions',
          value: '1,248',
          icon: Icons.subscriptions_outlined,
        ),
        ModuleKpi(
          title: 'Active Tenants',
          value: '986',
          icon: Icons.business_outlined,
        ),
        ModuleKpi(
          title: 'Renewals Due',
          value: '74',
          icon: Icons.autorenew_outlined,
        ),
        ModuleKpi(
          title: 'Trial Accounts',
          value: '126',
          icon: Icons.timer_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Plans & Features',
          icon: Icons.view_list_outlined,
          route: AppRoutes.subscriptionPlansFeatures,
        ),
        ModuleQuickAction(
          title: 'Tenant Subscriptions',
          icon: Icons.business_outlined,
          route: AppRoutes.tenantSubscriptions,
        ),
        ModuleQuickAction(
          title: 'Usage & Quotas',
          icon: Icons.data_usage_outlined,
          route: AppRoutes.subscriptionUsageQuotas,
        ),
        ModuleQuickAction(
          title: 'Payment Tracking',
          icon: Icons.payments_outlined,
          route: AppRoutes.subscriptionPaymentTracking,
        ),
        ModuleQuickAction(
          title: 'License Allocation',
          icon: Icons.assignment_ind_outlined,
          route: AppRoutes.subscriptionLicenseAllocation,
        ),
        ModuleQuickAction(
          title: 'Renewals',
          icon: Icons.autorenew_outlined,
          route: AppRoutes.subscriptionRenewals,
        ),
        ModuleQuickAction(
          title: 'Trial Management',
          icon: Icons.timer_outlined,
          route: AppRoutes.subscriptionTrialManagement,
        ),
        ModuleQuickAction(
          title: 'Billing Integration',
          icon: Icons.receipt_long_outlined,
          route: AppRoutes.subscriptionBillingIntegration,
        ),
      ],
    );
  }
}
