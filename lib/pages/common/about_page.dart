


















import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_provider.dart';
import '../../app_theme.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF4FAF6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, size) {
                  final mobile = size.maxWidth < 700;

                  return Column(
                    children: [
                      _hero(context, mobile, user),
                      _features(mobile),
                      _stats(mobile),
                      const SizedBox(height: 25),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hero(BuildContext context, bool mobile, dynamic user) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        mobile ? 20 : 55,
        mobile ? 35 : 55,
        mobile ? 20 : 55,
        35,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [AppTheme.lightBlue, Colors.white]),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.inventory_2_rounded,
            size: 55,
            color: AppTheme.primaryBlue,
          ),

          const SizedBox(height: 15),

          Text(
            'Welcome to GT-InStock',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mobile ? 30 : 44,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'One Cloud Enterprise Platform',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mobile ? 25 : 30,
              fontWeight: FontWeight.w600,
              color: AppTheme.darkNavy,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Smart Inventory Management for a Better Tomorrow',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mobile ? 16 : 21,
              fontWeight: FontWeight.w600,
              color: AppTheme.darkNavy,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Manage inventory, track stock movements, monitor availability '
            'and make informed decisions — all in one place.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
          ),

          const SizedBox(height: 28),

          Container(
            constraints: const BoxConstraints(maxWidth: 720),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .07),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 15,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 55,
                  color: AppTheme.primaryBlue,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name.isEmpty ? 'GT-InStock User' : user.name,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      user.email.isEmpty ? 'No email available' : user.email,
                      style: const TextStyle(color: Colors.black87),
                    ),

                    const Text(
                      'Inventory Management User',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '●  Active User',
                    style: TextStyle(
                      color: AppTheme.darkNavy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget _features(bool mobile) {
    final features = [
      [
        Icons.inventory_2,
        'Inventory Management',
        'Organize and manage your products efficiently.',
      ],
      [
        Icons.swap_horiz,
        'Stock Movement',
        'Track incoming and outgoing stock easily.',
      ],
      [
        Icons.bar_chart,
        'Reports & Analytics',
        'Get insights and make better inventory decisions.',
      ],
      [
        Icons.notifications_active,
        'Stock Alerts',
        'Stay informed about low-stock availability.',
      ],
    ];

    return Padding(
      padding: EdgeInsets.all(mobile ? 18 : 40),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: features.map((item) {
          return Container(
            width: mobile ? double.infinity : 255,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.primaryBlue.withValues(alpha: .12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .04),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  item[0] as IconData,
                  color: AppTheme.primaryBlue,
                  size: 32,
                ),

                const SizedBox(height: 12),

                Text(
                  item[1] as String,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  item[2] as String,
                  style: const TextStyle(color: Colors.black54, height: 1.4),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _stats(bool mobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mobile ? 18 : 40),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 35,
        runSpacing: 18,
        children: const [
          _Stat(Icons.inventory, '1,248+', 'Products Tracked'),
          _Stat(Icons.people, '50+', 'Active Users'),
          _Stat(Icons.verified, '99%', 'System Uptime'),
          _Stat(Icons.trending_up, 'Better', 'Inventory Control'),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String title;

  const _Stat(this.icon, this.value, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppTheme.primaryBlue, size: 30),

        const SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.darkNavy,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(title, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ],
    );
  }
}
