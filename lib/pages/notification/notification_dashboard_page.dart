import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class NotificationDashboardPage extends StatelessWidget {
  const NotificationDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Notification',
      subtitle: 'Manage enterprise notifications, templates, delivery and preferences.',
      icon: Icons.notifications_outlined,
      kpis: [
        ModuleKpi(
          title: 'Total Notifications',
          value: '248K',
          icon: Icons.notifications_outlined,
        ),
        ModuleKpi(
          title: 'Delivered',
          value: '243K',
          icon: Icons.done_all_outlined,
        ),
        ModuleKpi(
          title: 'Pending',
          value: '1,842',
          icon: Icons.pending_outlined,
        ),
        ModuleKpi(title: 'Failed', value: '2,316', icon: Icons.error_outline),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'In-App Notifications',
          icon: Icons.notifications_outlined,
          route: AppRoutes.notificationInApp,
        ),
        ModuleQuickAction(
          title: 'Email Notifications',
          icon: Icons.email_outlined,
          route: AppRoutes.notificationEmail,
        ),
        ModuleQuickAction(
          title: 'SMS Notifications',
          icon: Icons.sms_outlined,
          route: AppRoutes.notificationSms,
        ),
        ModuleQuickAction(
          title: 'Push Notifications',
          icon: Icons.phone_android_outlined,
          route: AppRoutes.notificationPush,
        ),
        ModuleQuickAction(
          title: 'Templates',
          icon: Icons.description_outlined,
          route: AppRoutes.notificationTemplates,
        ),
        ModuleQuickAction(
          title: 'Preferences',
          icon: Icons.tune_outlined,
          route: AppRoutes.notificationPreferences,
        ),
        ModuleQuickAction(
          title: 'Schedules',
          icon: Icons.schedule_outlined,
          route: AppRoutes.notificationSchedules,
        ),
        ModuleQuickAction(
          title: 'Delivery Tracking',
          icon: Icons.track_changes_outlined,
          route: AppRoutes.notificationDeliveryTracking,
        ),
        ModuleQuickAction(
          title: 'Multi-Channel',
          icon: Icons.hub_outlined,
          route: AppRoutes.notificationMultiChannel,
        ),
      ],
    );
  }
}
