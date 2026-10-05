import 'package:flutter/material.dart';

import 'hrms_management_page.dart';

class RecruitmentPage extends StatelessWidget {
  const RecruitmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HrmsManagementPage(
      title: 'Recruitment',
      subtitle: 'Manage job openings, candidates and hiring activities.',
      icon: Icons.person_search_outlined,
      kpis: [
        HrmsKpi(title: 'Open Positions', value: '18', icon: Icons.work_outline),
        HrmsKpi(title: 'Candidates', value: '146', icon: Icons.people_outline),
        HrmsKpi(title: 'Interviews', value: '32', icon: Icons.event_outlined),
        HrmsKpi(
          title: 'Offers',
          value: '11',
          icon: Icons.card_membership_outlined,
        ),
      ],
      columns: ['Candidate', 'Position', 'Department', 'Interview', 'Status'],
      rows: [
        ['Amit Verma', 'Flutter Developer', 'IT', '12 Sep', 'Interview'],
        ['Kavya Rao', 'HR Executive', 'HR', '13 Sep', 'Shortlisted'],
        ['Rohit Kumar', 'Accountant', 'Finance', '14 Sep', 'Interview'],
        ['Neha Singh', 'Sales Executive', 'Sales', '15 Sep', 'Offer'],
        ['Manoj Patel', 'Operations Lead', 'Operations', '16 Sep', 'Screening'],
      ],
    );
  }
}
