
import 'asset_management_page.dart';
import 'general_ledger_page.dart';
import 'accounts_payable_page.dart';
import 'accounts_receivable_page.dart';
import 'budgeting_page.dart';
import 'costing_page.dart';
import 'financial_reports_page.dart';
import 'reconciliation_page.dart';
import 'multi_currency_page.dart';

class FinanceSubmoduleRoutes {
  static const generalLedger = '/finance/general-ledger';
  static const accountsPayable = '/finance/accounts-payable';
  static const accountsReceivable = '/finance/accounts-receivable';
  static const assetManagement = '/finance/asset-management';
  static const budgeting = '/finance/budgeting';
  static const costing = '/finance/costing';
  static const financialReports = '/finance/financial-reports';
  static const reconciliation = '/finance/reconciliation';
  static const multiCurrency = '/finance/multi-currency';

  static final pages = {
    generalLedger: (_) => const GeneralLedgerPage(),
    accountsPayable: (_) => const AccountsPayablePage(),
    accountsReceivable: (_) => const AccountsReceivablePage(),
    assetManagement: (_) => const AssetManagementPage(),
    budgeting: (_) => const BudgetingPage(),
    costing: (_) => const CostingPage(),
    financialReports: (_) => const FinancialReportsPage(),
    reconciliation: (_) => const ReconciliationPage(),
    multiCurrency: (_) => const MultiCurrencyPage(),
  };
}
