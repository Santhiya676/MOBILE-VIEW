import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModuleKpi {
  final String title;
  final String value;
  final IconData icon;

  const ModuleKpi({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class ModuleQuickAction {
  final String title;
  final IconData icon;
  final String? route;

  const ModuleQuickAction({
    required this.title,
    required this.icon,
    this.route,
  });
}

class EnterpriseModuleDashboard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<ModuleKpi> kpis;
  final List<ModuleQuickAction> quickActions;

  const EnterpriseModuleDashboard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.kpis,
    required this.quickActions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.blue, size: 25),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = 4;

                    if (constraints.maxWidth < 1000) {
                      columns = 2;
                    }

                    if (constraints.maxWidth < 600) {
                      columns = 1;
                    }

                    final cardWidth =
                        (constraints.maxWidth - ((columns - 1) * 16)) / columns;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: kpis.map((kpi) {
                        return SizedBox(
                          width: cardWidth,
                          child: _KpiCard(kpi: kpi),
                        );
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 28),

                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 14),

                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = 4;

                    if (constraints.maxWidth < 1000) {
                      columns = 3;
                    }

                    if (constraints.maxWidth < 700) {
                      columns = 2;
                    }

                    if (constraints.maxWidth < 450) {
                      columns = 1;
                    }

                    final width =
                        (constraints.maxWidth - ((columns - 1) * 14)) / columns;

                    return Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: quickActions.map((action) {
                        return SizedBox(
                          width: width,
                          child: _QuickActionCard(action: action),
                        );
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 28),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title Overview',
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Monitor and manage $title operations from this dashboard.',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Container(
                        width: double.infinity,
                        height: 320,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(icon, size: 44, color: Colors.grey.shade400),
                              const SizedBox(height: 12),
                              Text(
                                'Dashboard Analytics',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Charts and module data will appear here.',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final ModuleKpi kpi;

  const _KpiCard({required this.kpi});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(kpi.icon, color: Colors.blue, size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kpi.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  kpi.value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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

class _QuickActionCard extends StatelessWidget {
  final ModuleQuickAction action;

  const _QuickActionCard({required this.action});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: action.route == null
            ? null
            : () {
                context.push(action.route!);
              },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Icon(action.icon, color: Colors.blue, size: 21),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  action.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
