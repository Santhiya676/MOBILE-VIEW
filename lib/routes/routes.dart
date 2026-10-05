import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import '../pages/auth/login_page.dart';
import '../pages/auth/mobile_intro_page.dart';
import '../pages/common/profile_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/common/about_page.dart';
import '../pages/auth/forgot_password_page.dart';
import '../pages/common/dashboard_page.dart';
import '../pages/common/features_page.dart';
import '../pages/common/contact_page.dart';

import '../pages/hrms/hrms_dashboard_page.dart';
import '../pages/crm/crm_dashboard_page.dart';
import '../pages/erp_modules/erp_dashboard_page.dart';
import '../pages/finance/finance_dashboard_page.dart';
import '../pages/workflow/workflow_dashboard_page.dart';
import '../pages/documents/document_dashboard_page.dart';
import '../pages/subscription/subscription_dashboard_page.dart';
import '../pages/revenue/revenue_dashboard_page.dart';
import '../pages/reporting_bi/reporting_bi_dashboard_page.dart';
import '../pages/enterprise_ai/enterprise_ai_dashboard_page.dart';
import '../pages/notification/notification_dashboard_page.dart';
import '../pages/calendar/calendar_dashboard_page.dart';
import '../pages/integration/integration_dashboard_page.dart';
import '../pages/search/search_dashboard_page.dart';
import '../pages/security_compliance/security_compliance_dashboard_page.dart';

import '../pages/admin/global_settings_page.dart';
import '../pages/admin/platform_config_page.dart';
import '../pages/admin/license_management_page.dart';
import '../pages/admin/feature_management_page.dart';
import '../pages/admin/resource_management_page.dart';
import '../pages/admin/system_health_page.dart';
import '../pages/admin/tenant_templates_page.dart';

import '../pages/hrms/employee_management_page.dart';
import '../pages/hrms/attendance_page.dart';
import '../pages/hrms/leave_page.dart';
import '../pages/hrms/payroll_page.dart';
import '../pages/hrms/recruitment_page.dart';
import '../pages/hrms/performance_page.dart';
import '../pages/hrms/learning_page.dart';
import '../pages/hrms/ess_mss_page.dart';
import '../pages/hrms/asset_management_page.dart';

import '../pages/crm/leads_page.dart';
import '../pages/crm/opportunities_page.dart';
import '../pages/crm/accounts_page.dart';
import '../pages/crm/contacts_page.dart';
import '../pages/crm/activities_page.dart';
import '../pages/crm/pipeline_page.dart';
import '../pages/crm/quotations_page.dart';
import '../pages/crm/campaigns_page.dart';
import '../pages/crm/customer_support_page.dart';

import '../pages/erp_modules/inventory_page.dart';
import '../pages/erp_modules/warehouses_page.dart';
import '../pages/erp_modules/stock_movements_page.dart';
import '../pages/erp_modules/procurement_page.dart';
import '../pages/erp_modules/vendors_page.dart';
import '../pages/erp_modules/sales_orders_page.dart';
import '../pages/erp_modules/dispatch_page.dart';
import '../pages/erp_modules/production_page.dart';
import '../pages/erp_modules/asset_management_page.dart';
import '../pages/erp_modules/maintenance_page.dart';

import '../pages/finance/general_ledger_page.dart';
import '../pages/finance/accounts_payable_page.dart';
import '../pages/finance/accounts_receivable_page.dart';
import '../pages/finance/asset_management_page.dart'
    as finance_asset_management;
import '../pages/finance/budgeting_page.dart';
import '../pages/finance/costing_page.dart';
import '../pages/finance/financial_reports_page.dart';
import '../pages/finance/reconciliation_page.dart';
import '../pages/finance/multi_currency_page.dart';

import '../pages/workflow/workflow_builder_page.dart';
import '../pages/workflow/approvals_page.dart';
import '../pages/workflow/business_rules_page.dart';
import '../pages/workflow/process_automation_page.dart';
import '../pages/workflow/task_management_page.dart';
import '../pages/workflow/triggers_page.dart';
import '../pages/workflow/slas_escalations_page.dart';
import '../pages/workflow/process_monitoring_page.dart';
import '../pages/workflow/workflow_templates_page.dart';

import '../pages/documents/document_repository_page.dart';
import '../pages/documents/document_versioning_page.dart';
import '../pages/documents/document_upload_download_page.dart';
import '../pages/documents/document_access_control_page.dart';
import '../pages/documents/document_templates_page.dart';
import '../pages/documents/document_tagging_search_page.dart';
import '../pages/documents/document_retention_policies_page.dart';
import '../pages/documents/document_audit_trails_page.dart';
import '../pages/documents/document_ocr_integration_page.dart';

import '../pages/subscription/subscription_plans_features_page.dart';
import '../pages/subscription/tenant_subscriptions_page.dart';
import '../pages/subscription/subscription_usage_quotas_page.dart';
import '../pages/subscription/subscription_payment_tracking_page.dart';
import '../pages/subscription/subscription_license_allocation_page.dart';
import '../pages/subscription/subscription_renewals_page.dart';
import '../pages/subscription/subscription_trial_management_page.dart';
import '../pages/subscription/subscription_billing_integration_page.dart';

import '../pages/revenue/revenue_tracking_page.dart';
import '../pages/revenue/revenue_usage_analytics_page.dart';
import '../pages/revenue/revenue_forecasting_page.dart';
import '../pages/revenue/revenue_recognition_page.dart';
import '../pages/revenue/revenue_commission_management_page.dart';
import '../pages/revenue/revenue_financial_analytics_page.dart';
import '../pages/revenue/revenue_invoicing_page.dart';
import '../pages/revenue/revenue_integration_page.dart';

import '../pages/reporting_bi/reporting_standard_reports_page.dart';
import '../pages/reporting_bi/reporting_ad_hoc_reports_page.dart';
import '../pages/reporting_bi/reporting_data_exploration_page.dart';
import '../pages/reporting_bi/reporting_data_export_page.dart';
import '../pages/reporting_bi/reporting_scheduled_reports_page.dart';
import '../pages/reporting_bi/reporting_data_visualization_page.dart';
import '../pages/reporting_bi/reporting_self_service_analytics_page.dart';
import '../pages/reporting_bi/reporting_bi_management_page.dart';

import '../pages/enterprise_ai/enterprise_ai_models_page.dart';
import '../pages/enterprise_ai/enterprise_ai_chat_copilot_page.dart';
import '../pages/enterprise_ai/enterprise_ai_document_ai_ocr_page.dart';
import '../pages/enterprise_ai/enterprise_ai_predictive_analytics_page.dart';
import '../pages/enterprise_ai/enterprise_ai_recommendations_page.dart';
import '../pages/enterprise_ai/enterprise_ai_workflows_page.dart';
import '../pages/enterprise_ai/enterprise_ai_model_management_page.dart';
import '../pages/enterprise_ai/enterprise_ai_prompt_engineering_page.dart';
import '../pages/enterprise_ai/enterprise_ai_usage_logs_page.dart';

import '../pages/notification/notification_in_app_page.dart';
import '../pages/notification/notification_email_page.dart';
import '../pages/notification/notification_sms_page.dart';
import '../pages/notification/notification_push_page.dart';
import '../pages/notification/notification_templates_page.dart';
import '../pages/notification/notification_preferences_page.dart';
import '../pages/notification/notification_schedules_page.dart';
import '../pages/notification/notification_delivery_tracking_page.dart';
import '../pages/notification/notification_multi_channel_page.dart';

import '../pages/calendar/calendar_user_calendars_page.dart';
import '../pages/calendar/calendar_team_calendars_page.dart';
import '../pages/calendar/calendar_meeting_scheduler_page.dart';
import '../pages/calendar/calendar_recurring_booking_page.dart';
import '../pages/calendar/calendar_reminders_page.dart';
import '../pages/calendar/calendar_integrations_page.dart';
import '../pages/calendar/calendar_availability_page.dart';
import '../pages/calendar/calendar_event_notifications_page.dart';
import '../pages/calendar/calendar_shared_calendars_page.dart';

import '../pages/integration/integration_api_management_page.dart';
import '../pages/integration/integration_third_party_integrations_page.dart';
import '../pages/integration/integration_webhooks_page.dart';
import '../pages/integration/integration_event_streaming_page.dart';
import '../pages/integration/integration_data_transformation_page.dart';
import '../pages/integration/integration_etl_data_sync_page.dart';
import '../pages/integration/integration_connectors_page.dart';
import '../pages/integration/integration_logs_page.dart';

import '../pages/search/search_global_search_page.dart';
import '../pages/search/search_index_management_page.dart';
import '../pages/search/search_analytics_page.dart';
import '../pages/search/search_autocomplete_page.dart';
import '../pages/search/search_relevance_ranking_page.dart';
import '../pages/search/search_saved_searches_page.dart';
import '../pages/search/search_multi_tenant_index_page.dart';
import '../pages/search/search_synonyms_page.dart';
import '../pages/search/search_suggestion_engine_page.dart';

import '../pages/security_compliance/security_audit_logs_page.dart';
import '../pages/security_compliance/security_activity_tracking_page.dart';
import '../pages/security_compliance/security_compliance_reports_page.dart';
import '../pages/security_compliance/security_data_retention_page.dart';
import '../pages/security_compliance/security_policy_management_page.dart';
import '../pages/security_compliance/security_threat_detection_page.dart';
import '../pages/security_compliance/security_vulnerability_management_page.dart';
import '../pages/security_compliance/security_encryption_key_management_page.dart';
import '../pages/security_compliance/security_alerts_page.dart';

import '../providers/user_provider.dart';
import '../providers/auth_flow_provider.dart';
import '../widgets/app_layout.dart';

class AppRoutes {

  static const String landing = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';


  static const String dashboard = '/dashboard';
  static const String about = '/about';
  static const String profile = '/profile';
  static const String features = '/features';
  static const String contact = '/contact';


  static const String admin = '/admin';
  static const String hrms = '/hrms';
  static const String crm = '/crm';
  static const String erp = '/erp';
  static const String finance = '/finance';
  static const String workflow = '/workflow';
  static const String documents = '/documents';
  static const String subscription = '/subscription';
  static const String revenue = '/revenue';
  static const String reporting = '/reporting';
  static const String ai = '/ai';
  static const String notification = '/notification';
  static const String calendar = '/calendar';
  static const String integration = '/integration';
  static const String search = '/search';
  static const String security = '/security';

  static const String globalSettings = '/admin/global-settings';
  static const String platformConfig = '/admin/platform-config';
  static const String licenseManagement = '/admin/license-management';
  static const String featureManagement = '/admin/feature-management';
  static const String resourceManagement = '/admin/resource-management';
  static const String systemHealth = '/admin/system-health';
  static const String tenantTemplates = '/admin/tenant-templates';

  static const String hrmsEmployees = '/hrms/employees';
  static const String hrmsAttendance = '/hrms/attendance';
  static const String hrmsLeave = '/hrms/leave';
  static const String hrmsPayroll = '/hrms/payroll';
  static const String hrmsRecruitment = '/hrms/recruitment';
  static const String hrmsPerformance = '/hrms/performance';
  static const String hrmsLearning = '/hrms/learning';
  static const String hrmsEssMss = '/hrms/ess-mss';
  static const String hrmsAssets = '/hrms/assets';

  static const String crmLeads = '/crm/leads';
  static const String crmOpportunities = '/crm/opportunities';
  static const String crmAccounts = '/crm/accounts';
  static const String crmContacts = '/crm/contacts';
  static const String crmActivities = '/crm/activities';
  static const String crmPipeline = '/crm/pipeline';
  static const String crmQuotations = '/crm/quotations';
  static const String crmCampaigns = '/crm/campaigns';
  static const String crmCustomerSupport = '/crm/customer-support';

  static const String inventory = '/inventory';
  static const String warehouses = '/warehouses';
  static const String stockMovements = '/stock-movements';
  static const String procurement = '/procurement';
  static const String vendors = '/vendors';
  static const String salesOrders = '/sales-orders';
  static const String dispatch = '/dispatch';
  static const String production = '/production';
  static const String assetManagement = '/asset-management';
  static const String maintenance = '/maintenance';

  static const String financeGeneralLedger = '/finance/general-ledger';
  static const String financeAccountsPayable = '/finance/accounts-payable';
  static const String financeAccountsReceivable =
      '/finance/accounts-receivable';
  static const String financeAssetManagement = '/finance/asset-management';
  static const String financeBudgeting = '/finance/budgeting';
  static const String financeCosting = '/finance/costing';
  static const String financeFinancialReports = '/finance/financial-reports';
  static const String financeReconciliation = '/finance/reconciliation';
  static const String financeMultiCurrency = '/finance/multi-currency';

  static const String workflowBuilder = '/workflow/builder';
  static const String workflowApprovals = '/workflow/approvals';
  static const String workflowBusinessRules = '/workflow/business-rules';
  static const String workflowProcessAutomation = '/workflow/automation';
  static const String workflowTasks = '/workflow/tasks';
  static const String workflowTriggers = '/workflow/triggers';
  static const String workflowSlas = '/workflow/slas';
  static const String workflowMonitoring = '/workflow/monitoring';
  static const String workflowTemplates = '/workflow/templates';

  static const String documentRepository = '/documents/repository';
  static const String documentVersioning = '/documents/versioning';
  static const String documentUploadDownload = '/documents/upload-download';
  static const String documentAccessControl = '/documents/access-control';
  static const String documentTemplates = '/documents/templates';
  static const String documentTaggingSearch = '/documents/tagging-search';
  static const String documentRetentionPolicies =
      '/documents/retention-policies';
  static const String documentAuditTrails = '/documents/audit-trails';
  static const String documentOcrIntegration = '/documents/ocr-integration';

  static const String subscriptionPlansFeatures =
      '/subscription/plans-features';
  static const String tenantSubscriptions =
      '/subscription/tenant-subscriptions';
  static const String subscriptionUsageQuotas = '/subscription/usage-quotas';
  static const String subscriptionPaymentTracking =
      '/subscription/payment-tracking';
  static const String subscriptionLicenseAllocation =
      '/subscription/license-allocation';
  static const String subscriptionRenewals = '/subscription/renewals';
  static const String subscriptionTrialManagement =
      '/subscription/trial-management';
  static const String subscriptionBillingIntegration =
      '/subscription/billing-integration';

  static const String revenueTracking = '/revenue/tracking';
  static const String revenueUsageAnalytics = '/revenue/usage-analytics';
  static const String revenueForecasting = '/revenue/forecasting';
  static const String revenueRecognition = '/revenue/recognition';
  static const String revenueCommissionManagement =
      '/revenue/commission-management';
  static const String revenueFinancialAnalytics =
      '/revenue/financial-analytics';
  static const String revenueInvoicing = '/revenue/invoicing';
  static const String revenueIntegration = '/revenue/integration';

  static const String reportingStandardReports = '/reporting/standard-reports';
  static const String reportingAdHocReports = '/reporting/ad-hoc-reports';
  static const String reportingDataExploration = '/reporting/data-exploration';
  static const String reportingDataExport = '/reporting/data-export';
  static const String reportingScheduledReports =
      '/reporting/scheduled-reports';
  static const String reportingDataVisualization =
      '/reporting/data-visualization';
  static const String reportingSelfServiceAnalytics =
      '/reporting/self-service-analytics';
  static const String reportingBiManagement = '/reporting/bi-management';

  static const String enterpriseAiModels = '/ai/models';
  static const String enterpriseAiChatCopilot = '/ai/chat-copilot';
  static const String enterpriseAiDocumentAiOcr = '/ai/document-ai-ocr';
  static const String enterpriseAiPredictiveAnalytics =
      '/ai/predictive-analytics';
  static const String enterpriseAiRecommendations = '/ai/recommendations';
  static const String enterpriseAiWorkflows = '/ai/workflows';
  static const String enterpriseAiModelManagement = '/ai/model-management';
  static const String enterpriseAiPromptEngineering = '/ai/prompt-engineering';
  static const String enterpriseAiUsageLogs = '/ai/usage-logs';

  static const String notificationInApp = '/notification/in-app';
  static const String notificationEmail = '/notification/email';
  static const String notificationSms = '/notification/sms';
  static const String notificationPush = '/notification/push';
  static const String notificationTemplates = '/notification/templates';
  static const String notificationPreferences = '/notification/preferences';
  static const String notificationSchedules = '/notification/schedules';
  static const String notificationDeliveryTracking =
      '/notification/delivery-tracking';
  static const String notificationMultiChannel = '/notification/multi-channel';

  static const String calendarUserCalendars = '/calendar/user-calendars';
  static const String calendarTeamCalendars = '/calendar/team-calendars';
  static const String calendarMeetingScheduler = '/calendar/meeting-scheduler';
  static const String calendarRecurringBooking = '/calendar/recurring-booking';
  static const String calendarReminders = '/calendar/reminders';
  static const String calendarIntegrations = '/calendar/integrations';
  static const String calendarAvailability = '/calendar/availability';
  static const String calendarEventNotifications =
      '/calendar/event-notifications';
  static const String calendarSharedCalendars = '/calendar/shared-calendars';

  static const String integrationApiManagement = '/integration/api-management';
  static const String integrationThirdPartyIntegrations =
      '/integration/third-party-integrations';
  static const String integrationWebhooks = '/integration/webhooks';
  static const String integrationEventStreaming =
      '/integration/event-streaming';
  static const String integrationDataTransformation =
      '/integration/data-transformation';
  static const String integrationEtlDataSync = '/integration/etl-data-sync';
  static const String integrationConnectors = '/integration/connectors';
  static const String integrationLogs = '/integration/logs';

  static const String searchGlobalSearch = '/search/global-search';
  static const String searchIndexManagement = '/search/index-management';
  static const String searchAnalytics = '/search/analytics';
  static const String searchAutocomplete = '/search/autocomplete';
  static const String searchRelevanceRanking = '/search/relevance-ranking';
  static const String searchSavedSearches = '/search/saved-searches';
  static const String searchMultiTenantIndex = '/search/multi-tenant-index';
  static const String searchSynonyms = '/search/synonyms';
  static const String searchSuggestionEngine = '/search/suggestion-engine';

  static const String securityAuditLogs = '/security/audit-logs';
  static const String securityActivityTracking = '/security/activity-tracking';
  static const String securityComplianceReports =
      '/security/compliance-reports';
  static const String securityDataRetention = '/security/data-retention';
  static const String securityPolicyManagement = '/security/policy-management';
  static const String securityThreatDetection = '/security/threat-detection';
  static const String securityVulnerabilityManagement =
      '/security/vulnerability-management';
  static const String securityEncryptionKeyManagement =
      '/security/encryption-key-management';
  static const String securityAlerts = '/security/alerts';


  static GoRouter createRouter(Ref ref) {
    return GoRouter(
      initialLocation: landing,

      redirect: (context, state) {
        final loggedIn = ref.read(userProvider).isLoggedIn;
        final location = state.uri.path;

        final isLoginPage = location == login;

        final isPublicPage =
            location == landing ||
            location == login ||
            location == register ||
            location == forgotPassword ||
            location == features ||
            location == contact;

        if (loggedIn && isLoginPage) {
          return dashboard;
        }

        if (!loggedIn && !isPublicPage) {
          return login;
        }

        return null;
      },

      routes: [

        GoRoute(
          path: landing,
          builder: (context, state) => provider.ChangeNotifierProvider(
            create: (_) => AuthFlowProvider(),
            child: LayoutBuilder(
              builder: (context, constraints) => constraints.maxWidth < 760
                  ? const MobileIntroPage()
                  : const LoginPage(),
            ),
          ),
        ),

        GoRoute(
          path: login,
          builder: (context, state) {
            return provider.ChangeNotifierProvider(
              create: (_) => AuthFlowProvider(),
              child: const LoginPage(),
            );
          },
        ),

        GoRoute(
          path: register,
          builder: (context, state) {
            return const RegisterPage();
          },
        ),

        GoRoute(
          path: forgotPassword,
          builder: (context, state) {
            return const ForgotPasswordPage();
          },
        ),

        ShellRoute(
          builder: (context, state, child) {
            return AppLayout(child: child);
          },

          routes: [

            GoRoute(
              path: dashboard,
              builder: (context, state) {
                return const DashboardPage();
              },
            ),

        GoRoute(
          path: admin,
          redirect: (context, state) => dashboard,
        ),

            GoRoute(
              path: globalSettings,
              builder: (context, state) {
                return const GlobalSettingsPage();
              },
            ),

            GoRoute(
              path: platformConfig,
              builder: (context, state) {
                return const PlatformConfigPage();
              },
            ),

            GoRoute(
              path: licenseManagement,
              builder: (context, state) {
                return const LicenseManagementPage();
              },
            ),

            GoRoute(
              path: featureManagement,
              builder: (context, state) {
                return const FeatureManagementPage();
              },
            ),

            GoRoute(
              path: resourceManagement,
              builder: (context, state) {
                return const ResourceManagementPage();
              },
            ),

            GoRoute(
              path: systemHealth,
              builder: (context, state) {
                return const SystemHealthPage();
              },
            ),

            GoRoute(
              path: tenantTemplates,
              builder: (context, state) {
                return const TenantTemplatesPage();
              },
            ),

            GoRoute(
              path: hrms,
              builder: (context, state) {
                return const HrmsDashboardPage();
              },
            ),
            GoRoute(
              path: hrmsEmployees,
              builder: (context, state) {
                return const EmployeeManagementPage();
              },
            ),

            GoRoute(
              path: hrmsAttendance,
              builder: (context, state) {
                return const AttendancePage();
              },
            ),

            GoRoute(
              path: hrmsLeave,
              builder: (context, state) {
                return const LeavePage();
              },
            ),

            GoRoute(
              path: hrmsPayroll,
              builder: (context, state) {
                return const PayrollPage();
              },
            ),

            GoRoute(
              path: hrmsRecruitment,
              builder: (context, state) {
                return const RecruitmentPage();
              },
            ),

            GoRoute(
              path: hrmsPerformance,
              builder: (context, state) {
                return const PerformancePage();
              },
            ),

            GoRoute(
              path: hrmsLearning,
              builder: (context, state) {
                return const LearningPage();
              },
            ),

            GoRoute(
              path: hrmsEssMss,
              builder: (context, state) {
                return const EssMssPage();
              },
            ),

            GoRoute(
              path: hrmsAssets,
              builder: (context, state) {
                return const HrmsAssetManagementPage();
              },
            ),

            GoRoute(
              path: AppRoutes.crm,
              builder: (context, state) => const CrmDashboardPage(),
            ),

            GoRoute(
              path: AppRoutes.crmLeads,
              builder: (context, state) => const LeadsPage(),
            ),

            GoRoute(
              path: AppRoutes.crmOpportunities,
              builder: (context, state) => const OpportunitiesPage(),
            ),

            GoRoute(
              path: AppRoutes.crmAccounts,
              builder: (context, state) => const AccountsPage(),
            ),

            GoRoute(
              path: AppRoutes.crmContacts,
              builder: (context, state) => const ContactsPage(),
            ),

            GoRoute(
              path: AppRoutes.crmActivities,
              builder: (context, state) => const ActivitiesPage(),
            ),

            GoRoute(
              path: AppRoutes.crmPipeline,
              builder: (context, state) => const PipelinePage(),
            ),

            GoRoute(
              path: AppRoutes.crmQuotations,
              builder: (context, state) => const QuotationsPage(),
            ),

            GoRoute(
              path: AppRoutes.crmCampaigns,
              builder: (context, state) => const CampaignsPage(),
            ),

            GoRoute(
              path: AppRoutes.crmCustomerSupport,
              builder: (context, state) => const CustomerSupportPage(),
            ),

            GoRoute(
              path: AppRoutes.erp,
              builder: (context, state) {
                return const ErpDashboardPage();
              },
            ),
            GoRoute(
              path: inventory,
              builder: (context, state) {
                return const InventoryPage();
              },
            ),

            GoRoute(
              path: warehouses,
              builder: (context, state) {
                return const WarehousesPage();
              },
            ),

            GoRoute(
              path: stockMovements,
              builder: (context, state) {
                return const StockMovementsPage();
              },
            ),

            GoRoute(
              path: procurement,
              builder: (context, state) {
                return const ProcurementPage();
              },
            ),

            GoRoute(
              path: vendors,
              builder: (context, state) {
                return const VendorsPage();
              },
            ),

            GoRoute(
              path: salesOrders,
              builder: (context, state) {
                return const SalesOrdersPage();
              },
            ),

            GoRoute(
              path: dispatch,
              builder: (context, state) {
                return const DispatchPage();
              },
            ),

            GoRoute(
              path: production,
              builder: (context, state) {
                return const ProductionPage();
              },
            ),

            GoRoute(
              path: assetManagement,
              builder: (context, state) {
                return const AssetManagementPage();
              },
            ),

            GoRoute(
              path: maintenance,
              builder: (context, state) {
                return const MaintenancePage();
              },
            ),

            GoRoute(
              path: finance,
              builder: (context, state) {
                return const FinanceDashboardPage();
              },
            ),

            GoRoute(
              path: financeGeneralLedger,
              builder: (context, state) {
                return const GeneralLedgerPage();
              },
            ),

            GoRoute(
              path: financeAccountsPayable,
              builder: (context, state) {
                return const AccountsPayablePage();
              },
            ),

            GoRoute(
              path: financeAccountsReceivable,
              builder: (context, state) {
                return const AccountsReceivablePage();
              },
            ),

            GoRoute(
              path: financeAssetManagement,
              builder: (context, state) =>
                  const finance_asset_management.AssetManagementPage(),
            ),

            GoRoute(
              path: financeBudgeting,
              builder: (context, state) {
                return const BudgetingPage();
              },
            ),

            GoRoute(
              path: financeCosting,
              builder: (context, state) {
                return const CostingPage();
              },
            ),

            GoRoute(
              path: financeFinancialReports,
              builder: (context, state) {
                return const FinancialReportsPage();
              },
            ),

            GoRoute(
              path: financeReconciliation,
              builder: (context, state) {
                return const ReconciliationPage();
              },
            ),

            GoRoute(
              path: financeMultiCurrency,
              builder: (context, state) {
                return const MultiCurrencyPage();
              },
            ),

            GoRoute(
              path: workflow,
              builder: (context, state) {
                return const WorkflowDashboardPage();
              },
            ),
            GoRoute(
              path: workflowBuilder,
              builder: (context, state) {
                return const WorkflowBuilderPage();
              },
            ),
            GoRoute(
              path: workflowApprovals,
              builder: (context, state) {
                return const ApprovalsPage();
              },
            ),
            GoRoute(
              path: workflowBusinessRules,
              builder: (context, state) {
                return const BusinessRulesPage();
              },
            ),
            GoRoute(
              path: workflowProcessAutomation,
              builder: (context, state) {
                return const ProcessAutomationPage();
              },
            ),
            GoRoute(
              path: workflowTasks,
              builder: (context, state) {
                return const TaskManagementPage();
              },
            ),
            GoRoute(
              path: workflowTriggers,
              builder: (context, state) {
                return const TriggersPage();
              },
            ),
            GoRoute(
              path: workflowSlas,
              builder: (context, state) {
                return const SlasEscalationsPage();
              },
            ),
            GoRoute(
              path: workflowMonitoring,
              builder: (context, state) {
                return const ProcessMonitoringPage();
              },
            ),
            GoRoute(
              path: workflowTemplates,
              builder: (context, state) {
                return const WorkflowTemplatesPage();
              },
            ),

            GoRoute(
              path: documents,
              builder: (context, state) {
                return const DocumentDashboardPage();
              },
            ),
            GoRoute(
              path: documentRepository,
              builder: (context, state) {
                return const DocumentRepositoryPage();
              },
            ),
            GoRoute(
              path: documentVersioning,
              builder: (context, state) {
                return const DocumentVersioningPage();
              },
            ),
            GoRoute(
              path: documentUploadDownload,
              builder: (context, state) {
                return const DocumentUploadDownloadPage();
              },
            ),
            GoRoute(
              path: documentAccessControl,
              builder: (context, state) {
                return const DocumentAccessControlPage();
              },
            ),
            GoRoute(
              path: documentTemplates,
              builder: (context, state) {
                return const DocumentTemplatesPage();
              },
            ),
            GoRoute(
              path: documentTaggingSearch,
              builder: (context, state) {
                return const DocumentTaggingSearchPage();
              },
            ),
            GoRoute(
              path: documentRetentionPolicies,
              builder: (context, state) {
                return const DocumentRetentionPoliciesPage();
              },
            ),
            GoRoute(
              path: documentAuditTrails,
              builder: (context, state) {
                return const DocumentAuditTrailsPage();
              },
            ),
            GoRoute(
              path: documentOcrIntegration,
              builder: (context, state) {
                return const DocumentOcrIntegrationPage();
              },
            ),

            GoRoute(
              path: subscription,
              builder: (context, state) {
                return const SubscriptionDashboardPage();
              },
            ),
            GoRoute(
              path: subscriptionPlansFeatures,
              builder: (context, state) {
                return const SubscriptionPlansFeaturesPage();
              },
            ),
            GoRoute(
              path: tenantSubscriptions,
              builder: (context, state) {
                return const TenantSubscriptionsPage();
              },
            ),
            GoRoute(
              path: subscriptionUsageQuotas,
              builder: (context, state) {
                return const SubscriptionUsageQuotasPage();
              },
            ),
            GoRoute(
              path: subscriptionPaymentTracking,
              builder: (context, state) {
                return const SubscriptionPaymentTrackingPage();
              },
            ),
            GoRoute(
              path: subscriptionLicenseAllocation,
              builder: (context, state) {
                return const SubscriptionLicenseAllocationPage();
              },
            ),
            GoRoute(
              path: subscriptionRenewals,
              builder: (context, state) {
                return const SubscriptionRenewalsPage();
              },
            ),
            GoRoute(
              path: subscriptionTrialManagement,
              builder: (context, state) {
                return const SubscriptionTrialManagementPage();
              },
            ),
            GoRoute(
              path: subscriptionBillingIntegration,
              builder: (context, state) {
                return const SubscriptionBillingIntegrationPage();
              },
            ),

            GoRoute(
              path: revenue,
              builder: (context, state) {
                return const RevenueDashboardPage();
              },
            ),
            GoRoute(
              path: revenueTracking,
              builder: (context, state) {
                return const RevenueTrackingPage();
              },
            ),
            GoRoute(
              path: revenueUsageAnalytics,
              builder: (context, state) {
                return const RevenueUsageAnalyticsPage();
              },
            ),
            GoRoute(
              path: revenueForecasting,
              builder: (context, state) {
                return const RevenueForecastingPage();
              },
            ),
            GoRoute(
              path: revenueRecognition,
              builder: (context, state) {
                return const RevenueRecognitionPage();
              },
            ),
            GoRoute(
              path: revenueCommissionManagement,
              builder: (context, state) {
                return const RevenueCommissionManagementPage();
              },
            ),
            GoRoute(
              path: revenueFinancialAnalytics,
              builder: (context, state) {
                return const RevenueFinancialAnalyticsPage();
              },
            ),
            GoRoute(
              path: revenueInvoicing,
              builder: (context, state) {
                return const RevenueInvoicingPage();
              },
            ),
            GoRoute(
              path: revenueIntegration,
              builder: (context, state) {
                return const RevenueIntegrationPage();
              },
            ),

            GoRoute(
              path: reporting,
              builder: (context, state) {
                return const ReportingBiDashboardPage();
              },
            ),
            GoRoute(
              path: reportingStandardReports,
              builder: (context, state) {
                return const ReportingStandardReportsPage();
              },
            ),
            GoRoute(
              path: reportingAdHocReports,
              builder: (context, state) {
                return const ReportingAdHocReportsPage();
              },
            ),
            GoRoute(
              path: reportingDataExploration,
              builder: (context, state) {
                return const ReportingDataExplorationPage();
              },
            ),
            GoRoute(
              path: reportingDataExport,
              builder: (context, state) {
                return const ReportingDataExportPage();
              },
            ),
            GoRoute(
              path: reportingScheduledReports,
              builder: (context, state) {
                return const ReportingScheduledReportsPage();
              },
            ),
            GoRoute(
              path: reportingDataVisualization,
              builder: (context, state) {
                return const ReportingDataVisualizationPage();
              },
            ),
            GoRoute(
              path: reportingSelfServiceAnalytics,
              builder: (context, state) {
                return const ReportingSelfServiceAnalyticsPage();
              },
            ),
            GoRoute(
              path: reportingBiManagement,
              builder: (context, state) {
                return const ReportingBiManagementPage();
              },
            ),

            GoRoute(
              path: ai,
              builder: (context, state) {
                return const EnterpriseAiDashboardPage();
              },
            ),
            GoRoute(
              path: enterpriseAiModels,
              builder: (context, state) {
                return const EnterpriseAiModelsPage();
              },
            ),
            GoRoute(
              path: enterpriseAiChatCopilot,
              builder: (context, state) {
                return const EnterpriseAiChatCopilotPage();
              },
            ),
            GoRoute(
              path: enterpriseAiDocumentAiOcr,
              builder: (context, state) {
                return const EnterpriseAiDocumentAiOcrPage();
              },
            ),
            GoRoute(
              path: enterpriseAiPredictiveAnalytics,
              builder: (context, state) {
                return const EnterpriseAiPredictiveAnalyticsPage();
              },
            ),
            GoRoute(
              path: enterpriseAiRecommendations,
              builder: (context, state) {
                return const EnterpriseAiRecommendationsPage();
              },
            ),
            GoRoute(
              path: enterpriseAiWorkflows,
              builder: (context, state) {
                return const EnterpriseAiWorkflowsPage();
              },
            ),
            GoRoute(
              path: enterpriseAiModelManagement,
              builder: (context, state) {
                return const EnterpriseAiModelManagementPage();
              },
            ),
            GoRoute(
              path: enterpriseAiPromptEngineering,
              builder: (context, state) {
                return const EnterpriseAiPromptEngineeringPage();
              },
            ),
            GoRoute(
              path: enterpriseAiUsageLogs,
              builder: (context, state) {
                return const EnterpriseAiUsageLogsPage();
              },
            ),

            GoRoute(
              path: notification,
              builder: (context, state) {
                return const NotificationDashboardPage();
              },
            ),
            GoRoute(
              path: notificationInApp,
              builder: (context, state) {
                return const NotificationInAppPage();
              },
            ),
            GoRoute(
              path: notificationEmail,
              builder: (context, state) {
                return const NotificationEmailPage();
              },
            ),
            GoRoute(
              path: notificationSms,
              builder: (context, state) {
                return const NotificationSmsPage();
              },
            ),
            GoRoute(
              path: notificationPush,
              builder: (context, state) {
                return const NotificationPushPage();
              },
            ),
            GoRoute(
              path: notificationTemplates,
              builder: (context, state) {
                return const NotificationTemplatesPage();
              },
            ),
            GoRoute(
              path: notificationPreferences,
              builder: (context, state) {
                return const NotificationPreferencesPage();
              },
            ),
            GoRoute(
              path: notificationSchedules,
              builder: (context, state) {
                return const NotificationSchedulesPage();
              },
            ),
            GoRoute(
              path: notificationDeliveryTracking,
              builder: (context, state) {
                return const NotificationDeliveryTrackingPage();
              },
            ),
            GoRoute(
              path: notificationMultiChannel,
              builder: (context, state) {
                return const NotificationMultiChannelPage();
              },
            ),

            GoRoute(
              path: calendar,
              builder: (context, state) {
                return const CalendarDashboardPage();
              },
            ),
            GoRoute(
              path: calendarUserCalendars,
              builder: (context, state) {
                return const CalendarUserCalendarsPage();
              },
            ),
            GoRoute(
              path: calendarTeamCalendars,
              builder: (context, state) {
                return const CalendarTeamCalendarsPage();
              },
            ),
            GoRoute(
              path: calendarMeetingScheduler,
              builder: (context, state) {
                return const CalendarMeetingSchedulerPage();
              },
            ),
            GoRoute(
              path: calendarRecurringBooking,
              builder: (context, state) {
                return const CalendarRecurringBookingPage();
              },
            ),
            GoRoute(
              path: calendarReminders,
              builder: (context, state) {
                return const CalendarRemindersPage();
              },
            ),
            GoRoute(
              path: calendarIntegrations,
              builder: (context, state) {
                return const CalendarIntegrationsPage();
              },
            ),
            GoRoute(
              path: calendarAvailability,
              builder: (context, state) {
                return const CalendarAvailabilityPage();
              },
            ),
            GoRoute(
              path: calendarEventNotifications,
              builder: (context, state) {
                return const CalendarEventNotificationsPage();
              },
            ),
            GoRoute(
              path: calendarSharedCalendars,
              builder: (context, state) {
                return const CalendarSharedCalendarsPage();
              },
            ),

            GoRoute(
              path: integration,
              builder: (context, state) {
                return const IntegrationDashboardPage();
              },
            ),
            GoRoute(
              path: integrationApiManagement,
              builder: (context, state) {
                return const IntegrationApiManagementPage();
              },
            ),
            GoRoute(
              path: integrationThirdPartyIntegrations,
              builder: (context, state) {
                return const IntegrationThirdPartyIntegrationsPage();
              },
            ),
            GoRoute(
              path: integrationWebhooks,
              builder: (context, state) {
                return const IntegrationWebhooksPage();
              },
            ),
            GoRoute(
              path: integrationEventStreaming,
              builder: (context, state) {
                return const IntegrationEventStreamingPage();
              },
            ),
            GoRoute(
              path: integrationDataTransformation,
              builder: (context, state) {
                return const IntegrationDataTransformationPage();
              },
            ),
            GoRoute(
              path: integrationEtlDataSync,
              builder: (context, state) {
                return const IntegrationEtlDataSyncPage();
              },
            ),
            GoRoute(
              path: integrationConnectors,
              builder: (context, state) {
                return const IntegrationConnectorsPage();
              },
            ),
            GoRoute(
              path: integrationLogs,
              builder: (context, state) {
                return const IntegrationLogsPage();
              },
            ),

            GoRoute(
              path: search,
              builder: (context, state) {
                return const SearchDashboardPage();
              },
            ),
            GoRoute(
              path: searchGlobalSearch,
              builder: (context, state) {
                return const SearchGlobalSearchPage();
              },
            ),
            GoRoute(
              path: searchIndexManagement,
              builder: (context, state) {
                return const SearchIndexManagementPage();
              },
            ),
            GoRoute(
              path: searchAnalytics,
              builder: (context, state) {
                return const SearchAnalyticsPage();
              },
            ),
            GoRoute(
              path: searchAutocomplete,
              builder: (context, state) {
                return const SearchAutocompletePage();
              },
            ),
            GoRoute(
              path: searchRelevanceRanking,
              builder: (context, state) {
                return const SearchRelevanceRankingPage();
              },
            ),
            GoRoute(
              path: searchSavedSearches,
              builder: (context, state) {
                return const SearchSavedSearchesPage();
              },
            ),
            GoRoute(
              path: searchMultiTenantIndex,
              builder: (context, state) {
                return const SearchMultiTenantIndexPage();
              },
            ),
            GoRoute(
              path: searchSynonyms,
              builder: (context, state) {
                return const SearchSynonymsPage();
              },
            ),
            GoRoute(
              path: searchSuggestionEngine,
              builder: (context, state) {
                return const SearchSuggestionEnginePage();
              },
            ),

            GoRoute(
              path: security,
              builder: (context, state) {
                return const SecurityComplianceDashboardPage();
              },
            ),
            GoRoute(
              path: securityAuditLogs,
              builder: (context, state) {
                return const SecurityAuditLogsPage();
              },
            ),
            GoRoute(
              path: securityActivityTracking,
              builder: (context, state) {
                return const SecurityActivityTrackingPage();
              },
            ),
            GoRoute(
              path: securityComplianceReports,
              builder: (context, state) {
                return const SecurityComplianceReportsPage();
              },
            ),
            GoRoute(
              path: securityDataRetention,
              builder: (context, state) {
                return const SecurityDataRetentionPage();
              },
            ),
            GoRoute(
              path: securityPolicyManagement,
              builder: (context, state) {
                return const SecurityPolicyManagementPage();
              },
            ),
            GoRoute(
              path: securityThreatDetection,
              builder: (context, state) {
                return const SecurityThreatDetectionPage();
              },
            ),
            GoRoute(
              path: securityVulnerabilityManagement,
              builder: (context, state) {
                return const SecurityVulnerabilityManagementPage();
              },
            ),
            GoRoute(
              path: securityEncryptionKeyManagement,
              builder: (context, state) {
                return const SecurityEncryptionKeyManagementPage();
              },
            ),
            GoRoute(
              path: securityAlerts,
              builder: (context, state) {
                return const SecurityAlertsPage();
              },
            ),

            GoRoute(
              path: features,
              builder: (context, state) {
                return const FeaturesPage();
              },
            ),

            GoRoute(
              path: contact,
              builder: (context, state) {
                return const ContactPage();
              },
            ),

            GoRoute(
              path: about,
              builder: (context, state) {
                return const AboutPage();
              },
            ),

            GoRoute(
              path: profile,
              builder: (context, state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    );
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = AppRoutes.createRouter(ref);

  ref.listen<UserState>(userProvider, (previous, next) {
    if (previous?.isLoggedIn != next.isLoggedIn) {
      router.refresh();
    }
  });

  return router;
});
