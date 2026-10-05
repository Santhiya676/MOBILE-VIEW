import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'Attendance',
      subtitle: 'Monitor employee attendance and working hours.',
      icon: Icons.access_time_outlined,
      kpis: [
        HrmsKpi(
          title: 'Present Today',
          value: '224',
          icon: Icons.check_circle_outline,
        ),
        HrmsKpi(
          title: 'Absent Today',
          value: '12',
          icon: Icons.cancel_outlined,
        ),
        HrmsKpi(
          title: 'Late Arrivals',
          value: '8',
          icon: Icons.schedule_outlined,
        ),
        HrmsKpi(
          title: 'Attendance Rate',
          value: '94%',
          icon: Icons.analytics_outlined,
        ),
      ],
      columns: ['Employee', 'Department', 'Check In', 'Check Out', 'Status'],
      rows: [
        ['Rahul Sharma', 'IT', '09:02 AM', '06:05 PM', 'Present'],
        ['Priya Reddy', 'HR', '08:55 AM', '05:45 PM', 'Present'],
        ['Arjun Kumar', 'Finance', '09:35 AM', '06:10 PM', 'Late'],
        ['Sneha Rao', 'Sales', '-', '-', 'Absent'],
        ['Vikram Singh', 'Operations', '08:50 AM', '06:20 PM', 'Present'],
      ],
    );
  }
}
