import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/enterprise_module_dashboard.dart';

class CalendarDashboardPage extends StatelessWidget {
  const CalendarDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterpriseModuleDashboard(
      title: 'Calendar',
      subtitle:
          'Manage calendars, meetings, bookings, reminders and availability.',
      icon: Icons.calendar_month_outlined,
      kpis: [
        ModuleKpi(
          title: 'User Calendars',
          value: '4,826',
          icon: Icons.calendar_today_outlined,
        ),
        ModuleKpi(
          title: 'Meetings Today',
          value: '1,284',
          icon: Icons.event_outlined,
        ),
        ModuleKpi(
          title: 'Bookings',
          value: '486',
          icon: Icons.book_online_outlined,
        ),
        ModuleKpi(
          title: 'Shared Calendars',
          value: '326',
          icon: Icons.share_outlined,
        ),
      ],
      quickActions: [
        ModuleQuickAction(
          title: 'User Calendars',
          icon: Icons.calendar_today_outlined,
          route: AppRoutes.calendarUserCalendars,
        ),
        ModuleQuickAction(
          title: 'Team Calendars',
          icon: Icons.groups_outlined,
          route: AppRoutes.calendarTeamCalendars,
        ),
        ModuleQuickAction(
          title: 'Meeting Scheduler',
          icon: Icons.event_outlined,
          route: AppRoutes.calendarMeetingScheduler,
        ),
        ModuleQuickAction(
          title: 'Recurring Booking',
          icon: Icons.repeat_outlined,
          route: AppRoutes.calendarRecurringBooking,
        ),
        ModuleQuickAction(
          title: 'Reminders',
          icon: Icons.notifications_active_outlined,
          route: AppRoutes.calendarReminders,
        ),
        ModuleQuickAction(
          title: 'Integrations (Google / Outlook)',
          icon: Icons.sync_outlined,
          route: AppRoutes.calendarIntegrations,
        ),
        ModuleQuickAction(
          title: 'Availability',
          icon: Icons.access_time_outlined,
          route: AppRoutes.calendarAvailability,
        ),
        ModuleQuickAction(
          title: 'Event Notifications',
          icon: Icons.campaign_outlined,
          route: AppRoutes.calendarEventNotifications,
        ),
        ModuleQuickAction(
          title: 'Shared Calendars',
          icon: Icons.share_outlined,
          route: AppRoutes.calendarSharedCalendars,
        ),
      ],
    );
  }
}
