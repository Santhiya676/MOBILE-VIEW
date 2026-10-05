
















































































































































import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_theme.dart';
import '../../providers/user_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return _DashboardContent(
            width: constraints.maxWidth,
            userName: user.name,
          );
        },
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final double width;
  final String userName;

  const _DashboardContent({required this.width, required this.userName});

  @override
  Widget build(BuildContext context) {
    final bool smallMobile = width < 420;
    final bool mobile = width >= 420 && width < 700;
    final bool tablet = width >= 700 && width < 1100;
    final bool desktop = width >= 1100;

    final double horizontalPadding = width < 600
        ? 14
        : width < 1100
        ? 20
        : 28;
    final String displayUserName = userName.trim().isEmpty
        ? 'Administrator'
        : userName.trim();

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              18,
              horizontalPadding,
              0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1500),
                child: _DashboardHeader(
                  userName: displayUserName,
                  compact: smallMobile || mobile,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                0,
                horizontalPadding,
                28,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionTitle(
                        title: 'Enterprise Overview',
                        subtitle: 'OneCloud platform health, adoption, subscriptions and business activity',
                      ),
                      const SizedBox(height: 12),
                      _KpiSection(width: width),
                      const SizedBox(height: 22),
                      _PlatformChartsSection(
                        width: width,
                        desktop: desktop,
                        tablet: tablet,
                      ),
                      const SizedBox(height: 22),
                      _EnterpriseOperationsSection(
                        width: width,
                        desktop: desktop,
                      ),
                      const SizedBox(height: 22),
                      _ActivitySection(width: width, desktop: desktop),
                      const SizedBox(height: 22),
                      const _QuickActionsSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _DashboardHeader extends StatelessWidget {
  final String userName;
  final bool compact;

  const _DashboardHeader({required this.userName, required this.compact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 18 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4E9F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _welcome(userName),
                const SizedBox(height: 16),
                const _DateBadge(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _welcome(userName)),
                const _DateBadge(),
              ],
            ),
    );
  }

  Widget _welcome(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Good day,',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF737D8C),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: AppTheme.darkNavy,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Here is your OneCloud enterprise platform overview.',
          style: TextStyle(fontSize: 13, color: Color(0xFF737D8C)),
        ),
      ],
    );
  }
}

class _DateBadge extends StatelessWidget {
  const _DateBadge();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final months = const [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7FC),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: 16,
            color: AppTheme.primaryBlue,
          ),
          const SizedBox(width: 8),
          Text(
            '${now.day.toString().padLeft(2, '0')} '
            '${months[now.month - 1]} ${now.year}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
        ],
      ),
    );
  }
}


class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: Color(0xFF8992A3)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class _KpiSection extends StatelessWidget {
  final double width;

  const _KpiSection({required this.width});

  @override
  Widget build(BuildContext context) {
    const items = [
      _KpiData(
        title: 'Total Tenants',
        value: '128',
        subtitle: 'Registered organizations',
        icon: Icons.apartment_outlined,
        color: Color(0xFF2563EB),
      ),
      _KpiData(
        title: 'Active Users',
        value: '4,862',
        subtitle: 'Users active this month',
        icon: Icons.people_alt_outlined,
        color: Color(0xFF0891B2),
      ),
      _KpiData(
        title: 'Active Subscriptions',
        value: '116',
        subtitle: '90.6% of tenants',
        icon: Icons.card_membership_outlined,
        color: Color(0xFF059669),
      ),
      _KpiData(
        title: 'Monthly Revenue',
        value: '₹28.6L',
        subtitle: '+12.4% this month',
        icon: Icons.trending_up_outlined,
        color: Color(0xFF7C3AED),
      ),
      _KpiData(
        title: 'Enabled Modules',
        value: '14',
        subtitle: 'Enterprise services',
        icon: Icons.apps_outlined,
        color: Color(0xFFEA580C),
      ),
      _KpiData(
        title: 'API Requests',
        value: '2.4M',
        subtitle: 'Last 30 days',
        icon: Icons.api_outlined,
        color: Color(0xFF4F46E5),
      ),
      _KpiData(
        title: 'System Uptime',
        value: '99.98%',
        subtitle: 'Platform availability',
        icon: Icons.cloud_done_outlined,
        color: Color(0xFF10B981),
      ),
      _KpiData(
        title: 'Open Alerts',
        value: '7',
        subtitle: '3 require attention',
        icon: Icons.notifications_active_outlined,
        color: Color(0xFFDC2626),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final int columns;

        if (availableWidth < 500) {
          columns = 1;
        } else if (availableWidth < 850) {
          columns = 2;
        } else if (availableWidth < 1200) {
          columns = 3;
        } else {
          columns = 4;
        }

        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: items.map((item) {
            final cardWidth = columns == 1
                ? availableWidth
                : (availableWidth - (14 * (columns - 1))) / columns;

            return SizedBox(
              width: cardWidth,
              child: _KpiCard(data: item),
            );
          }).toList(),
        );
      },
    );
  }
}

class _KpiCard extends StatelessWidget {
  final _KpiData data;

  const _KpiCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 112),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE5EAF0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(data.icon, color: data.color, size: 22),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF7A8493),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  data.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.darkNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: data.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _PlatformChartsSection extends StatelessWidget {
  final double width;
  final bool desktop;
  final bool tablet;

  const _PlatformChartsSection({
    required this.width,
    required this.desktop,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    if (desktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 7, child: _TenantGrowthCard()),
          const SizedBox(width: 18),
          const Expanded(flex: 4, child: _SubscriptionHealthCard()),
        ],
      );
    }

    return const Column(
      children: [
        _TenantGrowthCard(),
        SizedBox(height: 18),
        _SubscriptionHealthCard(),
      ],
    );
  }
}

class _TenantGrowthCard extends StatelessWidget {
  const _TenantGrowthCard();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Tenant & Platform Growth',
      subtitle: 'New organizations onboarded over the last 7 months',
      trailing: const _SmallBadge(text: 'Last 7 Months'),
      child: Column(
        children: [
          const SizedBox(height: 14),
          SizedBox(
            height: 270,
            width: double.infinity,
            child: CustomPaint(
              painter: _BarChartPainter(
                values: const [72, 81, 88, 96, 104, 116, 128],
                labels: const ['Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 18,
            runSpacing: 8,
            children: [
              _LegendItem(text: 'Total Tenants', color: Color(0xFF2563EB)),
              _LegendItem(text: 'Active', color: Color(0xFF10B981)),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubscriptionHealthCard extends StatelessWidget {
  const _SubscriptionHealthCard();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Subscription Health',
      subtitle: 'Current OneCloud subscription distribution',
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 230,
            width: double.infinity,
            child: CustomPaint(
              painter: _PieChartPainter(
                values: const [116, 8, 4],
                colors: const [
                  Color(0xFF10B981),
                  Color(0xFFF59E0B),
                  Color(0xFFEF4444),
                ],
                centerValue: '128',
                centerLabel: 'Tenants',
              ),
            ),
          ),
          const SizedBox(height: 8),
          const _HealthRow(
            title: 'Active Subscriptions',
            value: '116',
            percentage: '90.6%',
            color: Color(0xFF10B981),
          ),
          const SizedBox(height: 10),
          const _HealthRow(
            title: 'Trial / Evaluation',
            value: '8',
            percentage: '6.3%',
            color: Color(0xFFF59E0B),
          ),
          const SizedBox(height: 10),
          const _HealthRow(
            title: 'Expired / Suspended',
            value: '4',
            percentage: '3.1%',
            color: Color(0xFFEF4444),
          ),
        ],
      ),
    );
  }
}

class _HealthRow extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color color;

  const _HealthRow({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF626C7B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.darkNavy,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 45,
          child: Text(
            percentage,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}


class _EnterpriseOperationsSection extends StatelessWidget {
  final double width;
  final bool desktop;

  const _EnterpriseOperationsSection({
    required this.width,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (desktop) {
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _ModuleAdoptionCard()),
          SizedBox(width: 18),
          Expanded(child: _PlatformHealthCard()),
        ],
      );
    }

    return const Column(
      children: [
        _ModuleAdoptionCard(),
        SizedBox(height: 18),
        _PlatformHealthCard(),
      ],
    );
  }
}

class _ModuleAdoptionCard extends StatelessWidget {
  const _ModuleAdoptionCard();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Module Adoption',
      subtitle: 'Most-used OneCloud enterprise services',
      child: Column(
        children: [
          const SizedBox(height: 12),
          _ProgressRow(
            title: 'ERP',
            value: 96,
            total: 128,
            color: const Color(0xFF2563EB),
          ),
          const SizedBox(height: 17),
          _ProgressRow(
            title: 'HRMS',
            value: 84,
            total: 128,
            color: const Color(0xFF0891B2),
          ),
          const SizedBox(height: 17),
          _ProgressRow(
            title: 'CRM',
            value: 78,
            total: 128,
            color: const Color(0xFF7C3AED),
          ),
          const SizedBox(height: 17),
          _ProgressRow(
            title: 'Finance & Accounting',
            value: 71,
            total: 128,
            color: const Color(0xFF059669),
          ),
          const SizedBox(height: 17),
          _ProgressRow(
            title: 'Workflow & Automation',
            value: 63,
            total: 128,
            color: const Color(0xFFEA580C),
          ),
        ],
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  final String title;
  final int value;
  final int total;
  final Color color;

  const _ProgressRow({
    required this.title,
    required this.value,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : value / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
            ),
            Text(
              '$value Tenants',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 9,
            backgroundColor: const Color(0xFFE9EEF5),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _PlatformHealthCard extends StatelessWidget {
  const _PlatformHealthCard();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Platform Health',
      subtitle: 'Current OneCloud infrastructure and service status',
      child: Column(
        children: [
          const SizedBox(height: 8),
          const _HealthStatusRow(
            icon: Icons.cloud_done_outlined,
            title: 'Core Platform',
            description: 'All core services operational',
            status: 'Operational',
            color: Color(0xFF10B981),
          ),
          const SizedBox(height: 10),
          const _HealthStatusRow(
            icon: Icons.api_outlined,
            title: 'API Gateway',
            description: 'Normal request processing',
            status: 'Operational',
            color: Color(0xFF10B981),
          ),
          const SizedBox(height: 10),
          const _HealthStatusRow(
            icon: Icons.storage_outlined,
            title: 'Data Services',
            description: 'Storage and database healthy',
            status: 'Operational',
            color: Color(0xFF10B981),
          ),
          const SizedBox(height: 10),
          const _HealthStatusRow(
            icon: Icons.account_tree_outlined,
            title: 'Workflow Engine',
            description: '1 delayed workflow',
            status: 'Warning',
            color: Color(0xFFF59E0B),
          ),
          const SizedBox(height: 10),
          const _HealthStatusRow(
            icon: Icons.notifications_active_outlined,
            title: 'Notifications',
            description: 'Email, SMS and push services',
            status: 'Operational',
            color: Color(0xFF10B981),
          ),
        ],
      ),
    );
  }
}

class _HealthStatusRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String status;
  final Color color;

  const _HealthStatusRow({
    required this.icon,
    required this.title,
    required this.description,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFECEFF3)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 9, color: Color(0xFF8992A3)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _ActivitySection extends StatelessWidget {
  final double width;
  final bool desktop;

  const _ActivitySection({required this.width, required this.desktop});

  @override
  Widget build(BuildContext context) {
    if (desktop) {
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 7, child: _RecentActivityCard()),
          SizedBox(width: 18),
          Expanded(flex: 4, child: _AttentionCard()),
        ],
      );
    }

    return const Column(
      children: [_RecentActivityCard(), SizedBox(height: 18), _AttentionCard()],
    );
  }
}

class _RecentActivityCard extends StatelessWidget {
  const _RecentActivityCard();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Recent Platform Activity',
      subtitle: 'Latest OneCloud enterprise events',
      trailing: TextButton(
        onPressed: () {},
        child: const Text(
          'View All',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppTheme.primaryBlue,
          ),
        ),
      ),
      child: Column(
        children: [
          const _ActivityItem(
            icon: Icons.apartment_outlined,
            color: Color(0xFF2563EB),
            title: 'New Tenant Onboarded',
            description: 'Acme Technologies joined the OneCloud platform',
            time: '10 min ago',
          ),
          const Divider(height: 1, color: Color(0xFFEDF0F4)),
          const _ActivityItem(
            icon: Icons.card_membership_outlined,
            color: Color(0xFF10B981),
            title: 'Subscription Activated',
            description: 'Enterprise plan activated for Global Retail Ltd.',
            time: '32 min ago',
          ),
          const Divider(height: 1, color: Color(0xFFEDF0F4)),
          const _ActivityItem(
            icon: Icons.extension_outlined,
            color: Color(0xFF7C3AED),
            title: 'Module Enabled',
            description: 'CRM enabled for NorthStar Solutions',
            time: '1 hour ago',
          ),
          const Divider(height: 1, color: Color(0xFFEDF0F4)),
          const _ActivityItem(
            icon: Icons.person_add_alt_1_outlined,
            color: Color(0xFF0891B2),
            title: 'User Provisioned',
            description: '24 new users added across 3 tenants',
            time: '2 hours ago',
          ),
          const Divider(height: 1, color: Color(0xFFEDF0F4)),
          const _ActivityItem(
            icon: Icons.settings_outlined,
            color: Color(0xFFEA580C),
            title: 'Platform Configuration Updated',
            description: 'Global notification settings were updated',
            time: '3 hours ago',
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final String time;

  const _ActivityItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 19),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF7A8493),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(fontSize: 9, color: Color(0xFF98A2B3)),
          ),
        ],
      ),
    );
  }
}

class _AttentionCard extends StatelessWidget {
  const _AttentionCard();

  @override
  Widget build(BuildContext context) {
    return _Panel(
      title: 'Attention Required',
      subtitle: 'OneCloud platform items that need action',
      child: Column(
        children: [
          const _AttentionItem(
            icon: Icons.notifications_active_outlined,
            color: Color(0xFFDC2626),
            title: 'Open Platform Alerts',
            value: '7',
            description: '3 alerts require immediate attention',
          ),
          const SizedBox(height: 11),
          const _AttentionItem(
            icon: Icons.card_membership_outlined,
            color: Color(0xFFF59E0B),
            title: 'Expiring Subscriptions',
            value: '6',
            description: 'Subscriptions expire within 30 days',
          ),
          const SizedBox(height: 11),
          const _AttentionItem(
            icon: Icons.person_off_outlined,
            color: Color(0xFF7C3AED),
            title: 'Inactive Tenants',
            value: '8',
            description: 'No activity recorded in the last 30 days',
          ),
          const SizedBox(height: 11),
          const _AttentionItem(
            icon: Icons.account_tree_outlined,
            color: Color(0xFFEA580C),
            title: 'Delayed Workflows',
            value: '1',
            description: 'Workflow execution requires attention',
          ),
        ],
      ),
    );
  }
}

class _AttentionItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;
  final String description;

  const _AttentionItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFECEFF3)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 9, color: Color(0xFF8992A3)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}


class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection();

  @override
  Widget build(BuildContext context) {
    const actions = [
      _QuickAction(
        title: 'Platform Admin',
        subtitle: 'Manage platform',
        icon: Icons.admin_panel_settings_outlined,
        color: Color(0xFF2563EB),
      ),
      _QuickAction(
        title: 'Tenants',
        subtitle: 'Manage organizations',
        icon: Icons.apartment_outlined,
        color: Color(0xFF0891B2),
      ),
      _QuickAction(
        title: 'Subscriptions',
        subtitle: 'Manage plans',
        icon: Icons.card_membership_outlined,
        color: Color(0xFF7C3AED),
      ),
      _QuickAction(
        title: 'User Management',
        subtitle: 'Manage users',
        icon: Icons.people_alt_outlined,
        color: Color(0xFF059669),
      ),
      _QuickAction(
        title: 'Reports & BI',
        subtitle: 'View analytics',
        icon: Icons.analytics_outlined,
        color: Color(0xFFEA580C),
      ),
      _QuickAction(
        title: 'System Health',
        subtitle: 'Check platform',
        icon: Icons.monitor_heart_outlined,
        color: Color(0xFF4F46E5),
      ),
    ];

    return _Panel(
      title: 'Quick Actions',
      subtitle: 'Frequently used OneCloud platform operations',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final available = constraints.maxWidth;
          final int columns;

          if (available < 450) {
            columns = 1;
          } else if (available < 750) {
            columns = 2;
          } else if (available < 1050) {
            columns = 3;
          } else {
            columns = 6;
          }

          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: actions.map((action) {
              final cardWidth = columns == 1
                  ? available
                  : (available - (12 * (columns - 1))) / columns;

              return SizedBox(
                width: cardWidth,
                child: _QuickActionCard(action: action),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final _QuickAction action;

  const _QuickActionCard({required this.action});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(13),
        child: Container(
          constraints: const BoxConstraints(minHeight: 92),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: const Color(0xFFE7EBF0)),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: action.color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(action.icon, color: action.color, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      action.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      action.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF8992A3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _Panel extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Widget? trailing;

  const _Panel({
    required this.title,
    required this.subtitle,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5EAF0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 11,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF8992A3),
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          ),
          const SizedBox(height: 4),
          child,
        ],
      ),
    );
  }
}


class _SmallBadge extends StatelessWidget {
  final String text;

  const _SmallBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: Color(0xFF2563EB),
        ),
      ),
    );
  }
}


class _LegendItem extends StatelessWidget {
  final String text;
  final Color color;

  const _LegendItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF737D8C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}


class _BarChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;

  _BarChartPainter({required this.values, required this.labels});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;

    const left = 35.0;
    const right = 12.0;
    const top = 20.0;
    const bottom = 35.0;

    final chartWidth = size.width - left - right;
    final chartHeight = size.height - top - bottom;

    double maxValue = 0;
    for (final value in values) {
      if (value > maxValue) maxValue = value;
    }

    if (maxValue <= 0) maxValue = 1;

    final gridPaint = Paint()
      ..color = const Color(0xFFE8EDF3)
      ..strokeWidth = 1;

    for (int i = 0; i <= 4; i++) {
      final y = top + chartHeight - (chartHeight * i / 4);
      canvas.drawLine(
        Offset(left, y),
        Offset(size.width - right, y),
        gridPaint,
      );
    }

    final slotWidth = chartWidth / values.length;
    final double barWidth = math.min(34.0, slotWidth * 0.50);
    final barPaint = Paint()..color = const Color(0xFF2563EB);

    for (int i = 0; i < values.length; i++) {
      final double barHeight = values[i] / maxValue * chartHeight;
      final double x = left + slotWidth * i + (slotWidth - barWidth) / 2;
      final double y = top + chartHeight - barHeight;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          const Radius.circular(5),
        ),
        barPaint,
      );

      final valuePainter = TextPainter(
        text: TextSpan(
          text: values[i].round().toString(),
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: Color(0xFF667085),
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      valuePainter.layout();
      valuePainter.paint(
        canvas,
        Offset(
          x + barWidth / 2 - valuePainter.width / 2,
          math.max(0, y - valuePainter.height - 4),
        ),
      );

      final label = i < labels.length ? labels[i] : '';
      final labelPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: const TextStyle(fontSize: 9, color: Color(0xFF8992A3)),
        ),
        textDirection: TextDirection.ltr,
      );

      labelPainter.layout();
      labelPainter.paint(
        canvas,
        Offset(x + barWidth / 2 - labelPainter.width / 2, size.height - 22),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BarChartPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.labels != labels;
  }
}


class _PieChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final String centerValue;
  final String centerLabel;

  _PieChartPainter({
    required this.values,
    required this.colors,
    required this.centerValue,
    required this.centerLabel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty || colors.isEmpty) return;

    double total = 0;
    for (final value in values) {
      total += value;
    }

    if (total <= 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 12;

    double startAngle = -math.pi / 2;

    for (int i = 0; i < values.length; i++) {
      final sweep = values[i] / total * math.pi * 2;
      final path = Path();
      path.moveTo(center.dx, center.dy);

      const segments = 50;

      for (int step = 0; step <= segments; step++) {
        final angle = startAngle + sweep * step / segments;
        final x = center.dx + math.cos(angle) * radius;
        final y = center.dy + math.sin(angle) * radius;
        path.lineTo(x, y);
      }

      path.close();

      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      canvas.drawPath(path, paint);
      startAngle += sweep;
    }

    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.55, centerPaint);

    final valuePainter = TextPainter(
      text: TextSpan(
        text: centerValue,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w800,
          color: AppTheme.darkNavy,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    valuePainter.layout();
    valuePainter.paint(
      canvas,
      Offset(center.dx - valuePainter.width / 2, center.dy - 13),
    );

    final labelPainter = TextPainter(
      text: TextSpan(
        text: centerLabel,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Color(0xFF8992A3),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    labelPainter.layout();
    labelPainter.paint(
      canvas,
      Offset(center.dx - labelPainter.width / 2, center.dy + 13),
    );
  }

  @override
  bool shouldRepaint(covariant _PieChartPainter oldDelegate) {
    return oldDelegate.values != values ||
        oldDelegate.colors != colors ||
        oldDelegate.centerValue != centerValue ||
        oldDelegate.centerLabel != centerLabel;
  }
}


class _KpiData {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _KpiData({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class _QuickAction {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _QuickAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}
