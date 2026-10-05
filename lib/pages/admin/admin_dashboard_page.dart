import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_theme.dart';
import '../../routes/routes.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF5F6F8),
      child: LayoutBuilder(
        builder: (context, bounds) => SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(bounds.maxWidth < 600 ? 14 : 20, 13, bounds.maxWidth < 600 ? 14 : 20, 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (bounds.maxWidth < 420)
              Align(
                alignment: Alignment.centerRight,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                    tooltip: 'Refresh',
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Dashboard refreshed'))),
                    icon: const Icon(Icons.sync, size: 16),
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints.tightFor(width: 30, height: 30),
                  ),
                  const SizedBox(width: 5),
                  FilledButton.icon(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Export report is ready to connect to your reporting service'))),
                    icon: const Icon(Icons.file_download_outlined, size: 13),
                    label: const Text('Export', style: TextStyle(fontSize: 9)),
                    style: FilledButton.styleFrom(backgroundColor: const Color(0xFF3332E8), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  ),
                ]),
              )
            else
              Row(children: [
                const Text('Platform Administration', style: TextStyle(color: AppTheme.muted, fontSize: 9)),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 7), child: Text('/', style: TextStyle(color: AppTheme.muted, fontSize: 9))),
                const Text('Dashboard', style: TextStyle(color: AppTheme.ink, fontSize: 9, fontWeight: FontWeight.w600)),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Dashboard refreshed'))),
                  icon: const Icon(Icons.sync, size: 13),
                  label: const Text('Refresh', style: TextStyle(fontSize: 9)),
                  style: _smallButtonStyle,
                ),
                const SizedBox(width: 7),
                FilledButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Export report is ready to connect to your reporting service'))),
                  icon: const Icon(Icons.file_download_outlined, size: 13),
                  label: const Text('Export report', style: TextStyle(fontSize: 9)),
                  style: FilledButton.styleFrom(backgroundColor: const Color(0xFF3332E8), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ]),
            const SizedBox(height: 8),
            const Text('Super Admin Dashboard', style: TextStyle(color: AppTheme.ink, fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -.4)),
            const SizedBox(height: 3),
            const Text('Welcome back, Super Admin.', style: TextStyle(color: AppTheme.muted, fontSize: 10)),
            const SizedBox(height: 15),
            const _SectionTitle('PLATFORM OVERVIEW'),
            const SizedBox(height: 8),
            _ResponsiveGrid(
              minCardWidth: 145,
              children: const [
                _MetricCard(title: 'TOTAL USERS', value: '96,412', icon: Icons.people_alt_outlined, iconColor: Color(0xFF35A778), foot: '↑ 1.8% this month', footColor: Color(0xFF299461)),
                _MetricCard(title: 'ACTIVE USERS', value: '78,930', icon: Icons.verified_outlined, iconColor: Color(0xFF4775E8), foot: '● 4,215 online now', footColor: Color(0xFF39795E)),
                _MetricCard(title: 'ORGANIZATIONS', value: '1,842', icon: Icons.business_center_outlined, iconColor: Color(0xFFDB9B24), foot: '↑ 4.2% this month', footColor: Color(0xFF299461)),
                _MetricCard(title: 'LICENSES ACTIVE', value: '2,140', icon: Icons.description_outlined, iconColor: Colors.white, dark: true, foot: '27 expiring < 30 days', footColor: Colors.white),
              ],
            ),
            const SizedBox(height: 13),
            const _SectionTitle('SYSTEM STATUS'),
            const SizedBox(height: 7),
            _ResponsiveGrid(minCardWidth: 130, children: const [
              _StatusCard(title: 'SERVER STATUS', value: 'Healthy', color: Color(0xFF20A66A)),
              _StatusCard(title: 'DATABASE', value: 'Connected', color: Color(0xFF20A66A)),
              _StatusCard(title: 'API GATEWAY', value: 'Running', color: Color(0xFF20A66A)),
              _StatusCard(title: 'STORAGE', value: '68% used', color: Color(0xFFE3A130)),
            ]),
            const SizedBox(height: 9),
            _Panel(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const _SectionTitle('RESOURCE UTILIZATION'),
                const SizedBox(height: 15),
                const Row(children: [
                  Expanded(child: _UsageBar(label: 'CPU usage', value: 42, color: Color(0xFF31658F))),
                  SizedBox(width: 20),
                  Expanded(child: _UsageBar(label: 'Memory usage', value: 57, color: Color(0xFF31658F))),
                  SizedBox(width: 20),
                  Expanded(child: _UsageBar(label: 'Storage', value: 68, color: Color(0xFF50B995))),
                ]),
              ]),
            ),
            const SizedBox(height: 13),
            const _SectionTitle('QUICK NAVIGATION'),
            const SizedBox(height: 8),
            _ResponsiveGrid(minCardWidth: 150, children: [
              _QuickCard(icon: Icons.people_outline, title: 'User Management', sub: 'Manage accounts & roles', onTap: () => context.go(AppRoutes.resourceManagement)),
              _QuickCard(icon: Icons.settings_outlined, title: 'Platform Settings', sub: 'Global configuration', onTap: () => context.go(AppRoutes.globalSettings)),
              _QuickCard(icon: Icons.article_outlined, title: 'License Management', sub: 'Renewals & seat usage', onTap: () => context.go(AppRoutes.licenseManagement)),
              _QuickCard(icon: Icons.fact_check_outlined, title: 'Audit Logs', sub: 'Track admin actions', onTap: () => context.go(AppRoutes.securityAuditLogs)),
              _QuickCard(icon: Icons.notifications_none, title: 'Notifications', sub: 'Notification centre', onTap: () => context.go(AppRoutes.notification)),
              _QuickCard(icon: Icons.backup_outlined, title: 'Backup & Recovery', sub: 'Snapshots & restore', onTap: () => context.go(AppRoutes.systemHealth)),
              _QuickCard(icon: Icons.query_stats_outlined, title: 'Reports', sub: 'Platform analytics', onTap: () => context.go(AppRoutes.reporting)),
              _QuickCard(icon: Icons.shield_outlined, title: 'Security Center', sub: 'Threats & policies', onTap: () => context.go(AppRoutes.security)),
            ]),
            const SizedBox(height: 12),
            _ResponsiveGrid(minCardWidth: 290, children: const [
              _AlertsPanel(),
              _ActivityPanel(),
            ]),
          ]),
        ),
      ),
    );
  }
}

const _smallButtonStyle = ButtonStyle(
  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 9)),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
  side: WidgetStatePropertyAll(BorderSide(color: Color(0xFFDDE2E9))),
  visualDensity: VisualDensity.compact,
);

class _ResponsiveGrid extends StatelessWidget {
  final double minCardWidth;
  final List<Widget> children;
  const _ResponsiveGrid({required this.minCardWidth, required this.children});

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
        final columns = (box.maxWidth / (minCardWidth + 10)).floor().clamp(1, children.length).toInt();
        final gap = 9.0;
        final width = (box.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(spacing: gap, runSpacing: gap, children: children.map((child) => SizedBox(width: width, child: child)).toList());
      });
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);
  @override
  Widget build(BuildContext context) => Text(title, style: const TextStyle(color: Color(0xFF52627A), fontSize: 8, letterSpacing: .5, fontWeight: FontWeight.w500));
}

class _MetricCard extends StatelessWidget {
  final String title, value, foot;
  final IconData icon;
  final Color iconColor, footColor;
  final bool dark;
  const _MetricCard({required this.title, required this.value, required this.icon, required this.iconColor, required this.foot, required this.footColor, this.dark = false});
  @override
  Widget build(BuildContext context) => Container(
        height: 86,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: dark ? const Color(0xFF151B80) : Colors.white, borderRadius: BorderRadius.circular(8), border: dark ? null : Border.all(color: const Color(0xFFE5E9EF))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Text(title, style: TextStyle(color: dark ? Colors.white70 : AppTheme.muted, fontSize: 7, letterSpacing: .5)), const Spacer(), Container(width: 20, height: 20, decoration: BoxDecoration(color: dark ? Colors.white.withValues(alpha: .12) : iconColor.withValues(alpha: .1), borderRadius: BorderRadius.circular(5)), child: Icon(icon, color: iconColor, size: 12))]),
          const SizedBox(height: 5),
          Text(value, style: TextStyle(color: dark ? Colors.white : AppTheme.ink, fontSize: 16, fontWeight: FontWeight.w600, height: 1)),
          const Spacer(),
          Text(foot, style: TextStyle(color: footColor, fontSize: 7)),
        ]),
      );
}

class _StatusCard extends StatelessWidget {
  final String title, value;
  final Color color;
  const _StatusCard({required this.title, required this.value, required this.color});
  @override
  Widget build(BuildContext context) => Container(height: 43, padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFE5E9EF)), borderRadius: BorderRadius.circular(7)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: AppTheme.muted, fontSize: 6, letterSpacing: .45)), const SizedBox(height: 3), Row(children: [Icon(Icons.circle, size: 6, color: color), const SizedBox(width: 5), Text(value, style: const TextStyle(color: AppTheme.ink, fontSize: 8, fontWeight: FontWeight.w500))]) ]));
}

class _Panel extends StatelessWidget {
  final Widget child;
  const _Panel({required this.child});
  @override
  Widget build(BuildContext context) => Container(width: double.infinity, padding: const EdgeInsets.all(13), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFE5E9EF)), borderRadius: BorderRadius.circular(8)), child: child);
}

class _UsageBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const _UsageBar({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(label, style: const TextStyle(fontSize: 8, color: AppTheme.ink))), Text('$value%', style: const TextStyle(fontSize: 8, color: AppTheme.ink))]), const SizedBox(height: 6), ClipRRect(borderRadius: BorderRadius.circular(5), child: LinearProgressIndicator(value: value / 100, minHeight: 5, backgroundColor: const Color(0xFFE8ECF1), color: color))]);
}

class _QuickCard extends StatelessWidget {
  final IconData icon;
  final String title, sub;
  final VoidCallback onTap;
  const _QuickCard({required this.icon, required this.title, required this.sub, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(8), child: Container(height: 68, padding: const EdgeInsets.all(11), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFE5E9EF)), borderRadius: BorderRadius.circular(8)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 21, height: 21, decoration: BoxDecoration(color: const Color(0xFFEEF0FF), borderRadius: BorderRadius.circular(5)), child: Icon(icon, size: 12, color: const Color(0xFF4B4DEB))), const Spacer(), Text(title, style: const TextStyle(color: AppTheme.ink, fontSize: 8, fontWeight: FontWeight.w600)), const SizedBox(height: 2), Text(sub, style: const TextStyle(color: AppTheme.muted, fontSize: 7))])));
}

class _AlertsPanel extends StatelessWidget {
  const _AlertsPanel();
  @override
  Widget build(BuildContext context) => _Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Security alerts', style: TextStyle(color: AppTheme.ink, fontSize: 10, fontWeight: FontWeight.w600)), const SizedBox(height: 9), const _AlertTile(icon: Icons.warning_amber_outlined, title: '27 licenses expiring within 30 days', sub: 'Review renewals before Sep 22.', bg: Color(0xFFFBF1DF), color: Color(0xFFAD7419)), const SizedBox(height: 5), const _AlertTile(icon: Icons.info_outline, title: '3 organizations awaiting activation approval', sub: 'Submitted via self-signup, pending review.', bg: Color(0xFFEAF1FF), color: Color(0xFF2D61C8)), const SizedBox(height: 5), const _AlertTile(icon: Icons.lock_outline, title: 'Unusual login pattern detected', sub: 'Delta Retail Group — 3 logins from new locations.', bg: Color(0xFFFBF1DF), color: Color(0xFFAD7419)), const SizedBox(height: 7), SizedBox(width: double.infinity, height: 25, child: OutlinedButton(onPressed: () => context.go(AppRoutes.securityAlerts), style: _smallButtonStyle, child: const Text('View all alerts', style: TextStyle(fontSize: 8))))]));
}

class _AlertTile extends StatelessWidget {
  final IconData icon;
  final String title, sub;
  final Color bg, color;
  const _AlertTile({required this.icon, required this.title, required this.sub, required this.bg, required this.color});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)), child: Row(children: [Icon(icon, size: 12, color: color), const SizedBox(width: 7), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(color: color, fontSize: 7, fontWeight: FontWeight.w600)), Text(sub, style: TextStyle(color: color.withValues(alpha: .8), fontSize: 7))]))]));
}

class _ActivityPanel extends StatelessWidget {
  const _ActivityPanel();
  @override
  Widget build(BuildContext context) {
    const entries = [
      ('Ana Ferreira signed in from Lisbon, PT', '14 minutes ago', Color(0xFFE2F5EC), Icons.check),
      ('Unrecognized device signed in to Delta Retail Group', '52 minutes ago', Color(0xFFFFF3DF), Icons.priority_high),
      ('Renu Kapoor (Super Admin) signed in', '3 hours ago', Color(0xFFE2F5EC), Icons.check),
      ('Renu Kapoor (Super Admin) signed in', '3 hours ago', Color(0xFFE2F5EC), Icons.check),
      ('5 failed attempts on account j.mehta@acmecorp.com — locked', '4 hours ago', Color(0xFFFFE8E8), Icons.lock_outline),
    ];
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('Recent login activities', style: TextStyle(color: AppTheme.ink, fontSize: 10, fontWeight: FontWeight.w600)),
              Spacer(),
              Text('Last 24 hours', style: TextStyle(color: AppTheme.muted, fontSize: 7)),
            ],
          ),
          const SizedBox(height: 7),
          ...entries.map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFEEF0F3)))),
              child: Row(
                children: [
                  Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(color: e.$3, shape: BoxShape.circle),
                    child: Icon(e.$4, size: 9, color: const Color(0xFF44886B)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.$1, style: const TextStyle(color: AppTheme.ink, fontSize: 7.5)),
                        const SizedBox(height: 2),
                        Text(e.$2, style: const TextStyle(color: AppTheme.muted, fontSize: 6.5)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
