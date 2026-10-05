import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class FinanceDashboardPage extends StatelessWidget {
  const FinanceDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Finance & Accounting',
      subtitle: 'Manage financial operations, accounting and reporting.',
      icon: Icons.account_balance_wallet_outlined,

      kpis: [
        ModuleKpi(
          title: 'Total Revenue',
          value: '\$248K',
          icon: Icons.trending_up_outlined,
        ),
        ModuleKpi(
          title: 'Receivables',
          value: '\$82K',
          icon: Icons.receipt_long_outlined,
        ),
        ModuleKpi(
          title: 'Payables',
          value: '\$46K',
          icon: Icons.payments_outlined,
        ),
        ModuleKpi(
          title: 'Pending Entries',
          value: '18',
          icon: Icons.pending_actions_outlined,
        ),
      ],

      quickActions: [
        ModuleQuickAction(
          title: 'General Ledger',
          icon: Icons.menu_book_outlined,
          route: AppRoutes.financeGeneralLedger,
        ),
        ModuleQuickAction(
          title: 'Accounts Payable',
          icon: Icons.arrow_downward_outlined,
          route: AppRoutes.financeAccountsPayable,
        ),
        ModuleQuickAction(
          title: 'Accounts Receivable',
          icon: Icons.arrow_upward_outlined,
          route: AppRoutes.financeAccountsReceivable,
        ),
        ModuleQuickAction(
          title: 'Asset Management',
          icon: Icons.business_center_outlined,
          route: AppRoutes.financeAssetManagement,
        ),
        ModuleQuickAction(
          title: 'Budgeting',
          icon: Icons.account_balance_outlined,
          route: AppRoutes.financeBudgeting,
        ),
        ModuleQuickAction(
          title: 'Costing',
          icon: Icons.calculate_outlined,
          route: AppRoutes.financeCosting,
        ),
        ModuleQuickAction(
          title: 'Financial Reports',
          icon: Icons.bar_chart_outlined,
          route: AppRoutes.financeFinancialReports,
        ),
        ModuleQuickAction(
          title: 'Reconciliation',
          icon: Icons.sync_alt_outlined,
          route: AppRoutes.financeReconciliation,
        ),
        ModuleQuickAction(
          title: 'Multi-Currency',
          icon: Icons.currency_exchange_outlined,
          route: AppRoutes.financeMultiCurrency,
        ),
      ],
    );
  }
}
