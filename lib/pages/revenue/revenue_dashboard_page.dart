import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class RevenueDashboardPage extends StatelessWidget {
  const RevenueDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Revenue Management',
      subtitle:
          'Track revenue, usage, forecasting, invoicing and revenue analytics.',
      icon: Icons.trending_up_outlined,
      kpis: [
        ModuleKpi(
          title: 'Total Revenue',
          value: '₹24.8 Cr',
          icon: Icons.currency_rupee_outlined,
        ),
        ModuleKpi(
          title: 'Monthly Revenue',
          value: '₹2.46 Cr',
          icon: Icons.calendar_month_outlined,
        ),
        ModuleKpi(
          title: 'Outstanding',
          value: '₹38.6 L',
          icon: Icons.pending_outlined,
        ),
        ModuleKpi(
          title: 'Revenue Growth',
          value: '18.4%',
          icon: Icons.show_chart_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'Revenue Tracking',
          icon: Icons.trending_up_outlined,
          route: AppRoutes.revenueTracking,
        ),
        ModuleQuickAction(
          title: 'Usage Analytics',
          icon: Icons.analytics_outlined,
          route: AppRoutes.revenueUsageAnalytics,
        ),
        ModuleQuickAction(
          title: 'Forecasting',
          icon: Icons.insights_outlined,
          route: AppRoutes.revenueForecasting,
        ),
        ModuleQuickAction(
          title: 'Revenue Recognition',
          icon: Icons.fact_check_outlined,
          route: AppRoutes.revenueRecognition,
        ),
        ModuleQuickAction(
          title: 'Commission Management',
          icon: Icons.percent_outlined,
          route: AppRoutes.revenueCommissionManagement,
        ),
        ModuleQuickAction(
          title: 'Financial Analytics',
          icon: Icons.bar_chart_outlined,
          route: AppRoutes.revenueFinancialAnalytics,
        ),
        ModuleQuickAction(
          title: 'Invoicing',
          icon: Icons.receipt_long_outlined,
          route: AppRoutes.revenueInvoicing,
        ),
        ModuleQuickAction(
          title: 'Integration',
          icon: Icons.integration_instructions_outlined,
          route: AppRoutes.revenueIntegration,
        ),
      ],
    );
  }
}
