import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ErpDashboardPage extends StatelessWidget {
  const ErpDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return _ErpDashboardContent(width: constraints.maxWidth);
        },
      ),
    );
  }
}


class _ErpDashboardContent extends StatelessWidget {
  final double width;

  const _ErpDashboardContent({required this.width});

  @override
  Widget build(BuildContext context) {
    final bool smallMobile = width < 420;
    final bool mobile = width >= 420 && width < 700;
    final bool desktop = width >= 1100;

    final double horizontalPadding = width < 600
        ? 14
        : width < 1100
        ? 20
        : 28;

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
            child: _ErpHeader(compact: smallMobile || mobile),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                20,
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
                        title: 'ERP Overview',
                        subtitle: 'Inventory and business operations summary',
                      ),

                      const SizedBox(height: 12),

                      const _KpiSection(),

                      const SizedBox(height: 22),

                      _ChartsSection(
                        desktop: desktop,
                        tablet: width >= 700 && width < 1100,
                      ),

                      const SizedBox(height: 22),

                      _OperationalSection(desktop: desktop),

                      const SizedBox(height: 22),

                      _ActivitySection(desktop: desktop),

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


class _ErpHeader extends StatelessWidget {
  final bool compact;

  const _ErpHeader({required this.compact});

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
                _welcome(),
                const SizedBox(height: 16),
                const _DateBadge(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _welcome()),
                const _DateBadge(),
              ],
            ),
    );
  }

  Widget _welcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enterprise Resource Planning',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlue,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'ERP Dashboard',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: AppTheme.darkNavy,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Manage inventory, procurement, sales, dispatch and operations.',
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7FC),
        borderRadius: BorderRadius.circular(11),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 16,
            color: AppTheme.primaryBlue,
          ),
          SizedBox(width: 8),
          Text(
            '10 September 2026',
            style: TextStyle(
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
    return Column(
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
    );
  }
}


class _KpiSection extends StatelessWidget {
  const _KpiSection();

  @override
  Widget build(BuildContext context) {
    const List<_KpiData> items = [
      _KpiData(
        title: 'Total Products',
        value: '1,248',
        subtitle: 'Active products',
        icon: Icons.inventory_2_outlined,
        color: Color(0xFF2563EB),
      ),
      _KpiData(
        title: 'Total Stock',
        value: '18,420',
        subtitle: 'Units in inventory',
        icon: Icons.warehouse_outlined,
        color: Color(0xFF0891B2),
      ),
      _KpiData(
        title: 'Low Stock',
        value: '24',
        subtitle: 'Need attention',
        icon: Icons.warning_amber_rounded,
        color: Color(0xFFD97706),
      ),
      _KpiData(
        title: 'Out of Stock',
        value: '7',
        subtitle: 'Items unavailable',
        icon: Icons.remove_shopping_cart_outlined,
        color: Color(0xFFDC2626),
      ),
      _KpiData(
        title: 'Purchase Orders',
        value: '6',
        subtitle: '2 pending',
        icon: Icons.shopping_cart_outlined,
        color: Color(0xFF7C3AED),
      ),
      _KpiData(
        title: 'Sales Orders',
        value: '8',
        subtitle: '3 processing',
        icon: Icons.receipt_long_outlined,
        color: Color(0xFF059669),
      ),
      _KpiData(
        title: 'Ready to Dispatch',
        value: '1',
        subtitle: 'Awaiting dispatch',
        icon: Icons.local_shipping_outlined,
        color: Color(0xFFEA580C),
      ),
      _KpiData(
        title: 'In Transit',
        value: '2',
        subtitle: 'Active shipments',
        icon: Icons.route_outlined,
        color: Color(0xFF4F46E5),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;

        int columns;

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
            final double cardWidth = columns == 1
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


class _ChartsSection extends StatelessWidget {
  final bool desktop;
  final bool tablet;

  const _ChartsSection({required this.desktop, required this.tablet});

  @override
  Widget build(BuildContext context) {
    if (desktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 7, child: _StockMovementCard()),
          const SizedBox(width: 18),
          const Expanded(flex: 4, child: _InventoryHealthCard()),
        ],
      );
    }

    return const Column(
      children: [
        _StockMovementCard(),
        SizedBox(height: 18),
        _InventoryHealthCard(),
      ],
    );
  }
}


class _StockMovementCard extends StatelessWidget {
  const _StockMovementCard();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      title: 'Stock Movement',
      subtitle: 'Inventory movement across the last 7 days',
      trailing: _SmallBadge(text: 'Last 7 Days'),
      child: Column(
        children: [
          SizedBox(height: 14),
          SizedBox(
            height: 270,
            width: double.infinity,
            child: CustomPaint(
              painter: _BarChartPainter(
                values: [320, 460, 280, 540, 390, 610, 480],
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
              ),
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 18,
            runSpacing: 8,
            children: [
              _LegendItem(text: 'Stock In', color: Color(0xFF2563EB)),
              _LegendItem(text: 'Stock Out', color: Color(0xFF10B981)),
              _LegendItem(text: 'Transfer', color: Color(0xFFF59E0B)),
            ],
          ),
        ],
      ),
    );
  }
}


class _InventoryHealthCard extends StatelessWidget {
  const _InventoryHealthCard();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      title: 'Inventory Health',
      subtitle: 'Current availability of products',
      child: Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            height: 230,
            width: double.infinity,
            child: CustomPaint(
              painter: _PieChartPainter(
                values: [1217, 24, 7],
                colors: [
                  Color(0xFF10B981),
                  Color(0xFFF59E0B),
                  Color(0xFFEF4444),
                ],
                centerValue: '1,248',
                centerLabel: 'Products',
              ),
            ),
          ),
          SizedBox(height: 8),
          _HealthRow(
            title: 'Healthy Stock',
            value: '1,217',
            percentage: '97.5%',
            color: Color(0xFF10B981),
          ),
          SizedBox(height: 10),
          _HealthRow(
            title: 'Low Stock',
            value: '24',
            percentage: '1.9%',
            color: Color(0xFFF59E0B),
          ),
          SizedBox(height: 10),
          _HealthRow(
            title: 'Out of Stock',
            value: '7',
            percentage: '0.6%',
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


class _OperationalSection extends StatelessWidget {
  final bool desktop;

  const _OperationalSection({required this.desktop});

  @override
  Widget build(BuildContext context) {
    if (desktop) {
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _ProcurementCard()),
          SizedBox(width: 18),
          Expanded(child: _SalesOrderCard()),
        ],
      );
    }

    return const Column(
      children: [_ProcurementCard(), SizedBox(height: 18), _SalesOrderCard()],
    );
  }
}


class _ProcurementCard extends StatelessWidget {
  const _ProcurementCard();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      title: 'Procurement Pipeline',
      subtitle: 'Current purchase order status',
      child: Column(
        children: [
          SizedBox(height: 12),
          _ProgressRow(
            title: 'Pending',
            value: 2,
            total: 6,
            color: Color(0xFFF59E0B),
          ),
          SizedBox(height: 20),
          _ProgressRow(
            title: 'Approved',
            value: 2,
            total: 6,
            color: Color(0xFF2563EB),
          ),
          SizedBox(height: 20),
          _ProgressRow(
            title: 'Received',
            value: 2,
            total: 6,
            color: Color(0xFF10B981),
          ),
          SizedBox(height: 18),
          _PoValueRow(),
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
    final double progress = total == 0 ? 0 : value / total;

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
              '$value Orders',
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


class _PoValueRow extends StatelessWidget {
  const _PoValueRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.payments_outlined, size: 18, color: AppTheme.primaryBlue),
          SizedBox(width: 9),
          Expanded(
            child: Text(
              'Total PO Value',
              style: TextStyle(fontSize: 12, color: Color(0xFF697586)),
            ),
          ),
          Text(
            '₹6,32,050',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkNavy,
            ),
          ),
        ],
      ),
    );
  }
}


class _SalesOrderCard extends StatelessWidget {
  const _SalesOrderCard();

  @override
  Widget build(BuildContext context) {
    return const _Panel(
      title: 'Sales Order Pipeline',
      subtitle: 'Current sales order distribution',
      child: _SalesOrderContent(),
    );
  }
}

class _SalesOrderContent extends StatelessWidget {
  const _SalesOrderContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool narrow = constraints.maxWidth < 500;

        if (narrow) {
          return const Column(
            children: [
              SizedBox(height: 8),
              SizedBox(
                height: 220,
                width: double.infinity,
                child: CustomPaint(
                  painter: _PieChartPainter(
                    values: [2, 3, 3],
                    colors: [
                      Color(0xFFF59E0B),
                      Color(0xFF2563EB),
                      Color(0xFF10B981),
                    ],
                    centerValue: '8',
                    centerLabel: 'Orders',
                  ),
                ),
              ),
              SizedBox(height: 10),
              _OrderLegendList(),
            ],
          );
        }

        return const Row(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                height: 220,
                child: CustomPaint(
                  painter: _PieChartPainter(
                    values: [2, 3, 3],
                    colors: [
                      Color(0xFFF59E0B),
                      Color(0xFF2563EB),
                      Color(0xFF10B981),
                    ],
                    centerValue: '8',
                    centerLabel: 'Orders',
                  ),
                ),
              ),
            ),
            Expanded(flex: 4, child: _OrderLegendList()),
          ],
        );
      },
    );
  }
}


class _OrderLegendList extends StatelessWidget {
  const _OrderLegendList();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _OrderLegend(title: 'Pending', value: '2', color: Color(0xFFF59E0B)),
        SizedBox(height: 18),
        _OrderLegend(title: 'Processing', value: '3', color: Color(0xFF2563EB)),
        SizedBox(height: 18),
        _OrderLegend(title: 'Completed', value: '3', color: Color(0xFF10B981)),
      ],
    );
  }
}

class _OrderLegend extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _OrderLegend({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, color: Color(0xFF667085)),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppTheme.darkNavy,
          ),
        ),
      ],
    );
  }
}


class _ActivitySection extends StatelessWidget {
  final bool desktop;

  const _ActivitySection({required this.desktop});

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
    return const _Panel(
      title: 'Recent Activity',
      subtitle: 'Latest inventory and order updates',
      trailing: TextButton(
        onPressed: null,
        child: Text(
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
          _ActivityItem(
            icon: Icons.inventory_2_outlined,
            color: Color(0xFF2563EB),
            title: 'Product Added',
            description: 'Wireless Keyboard added to inventory',
            time: '10 min ago',
          ),
          Divider(height: 1, color: Color(0xFFEDF0F4)),
          _ActivityItem(
            icon: Icons.download_outlined,
            color: Color(0xFF10B981),
            title: 'Stock Received',
            description: '120 pcs Wireless Keyboard received',
            time: '35 min ago',
          ),
          Divider(height: 1, color: Color(0xFFEDF0F4)),
          _ActivityItem(
            icon: Icons.upload_outlined,
            color: Color(0xFFEA580C),
            title: 'Stock Dispatched',
            description: '45 pcs USB-C Cable dispatched',
            time: '1 hour ago',
          ),
          Divider(height: 1, color: Color(0xFFEDF0F4)),
          _ActivityItem(
            icon: Icons.warning_amber_rounded,
            color: Color(0xFFF59E0B),
            title: 'Low Stock Alert',
            description: 'Wireless Mouse has reached low stock',
            time: '2 hours ago',
          ),
          Divider(height: 1, color: Color(0xFFEDF0F4)),
          _ActivityItem(
            icon: Icons.shopping_cart_outlined,
            color: Color(0xFF7C3AED),
            title: 'Purchase Order Received',
            description: 'PO-2026-00418 completed',
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
    return const _Panel(
      title: 'Attention Required',
      subtitle: 'Items that need immediate action',
      child: Column(
        children: [
          _AttentionItem(
            icon: Icons.warning_amber_rounded,
            color: Color(0xFFF59E0B),
            title: 'Low Stock Items',
            value: '24',
            description: 'Products below reorder level',
          ),
          SizedBox(height: 11),
          _AttentionItem(
            icon: Icons.remove_shopping_cart_outlined,
            color: Color(0xFFEF4444),
            title: 'Out of Stock',
            value: '7',
            description: 'Products currently unavailable',
          ),
          SizedBox(height: 11),
          _AttentionItem(
            icon: Icons.pending_actions_outlined,
            color: Color(0xFF7C3AED),
            title: 'Pending Purchase Orders',
            value: '2',
            description: 'Orders awaiting approval',
          ),
          SizedBox(height: 11),
          _AttentionItem(
            icon: Icons.local_shipping_outlined,
            color: Color(0xFFEA580C),
            title: 'Delayed Dispatch',
            value: '1',
            description: 'Shipment requires attention',
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
                  maxLines: 1,
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
    const List<_QuickAction> actions = [
      _QuickAction(
        title: 'Inventory',
        subtitle: 'Manage stock',
        icon: Icons.inventory_2_outlined,
        color: Color(0xFF2563EB),
      ),
      _QuickAction(
        title: 'Receive Stock',
        subtitle: 'Stock inward',
        icon: Icons.download_outlined,
        color: Color(0xFF10B981),
      ),
      _QuickAction(
        title: 'Purchase Order',
        subtitle: 'Create PO',
        icon: Icons.shopping_cart_outlined,
        color: Color(0xFF7C3AED),
      ),
      _QuickAction(
        title: 'Sales Order',
        subtitle: 'Create order',
        icon: Icons.receipt_long_outlined,
        color: Color(0xFF0891B2),
      ),
      _QuickAction(
        title: 'Dispatch',
        subtitle: 'Ship order',
        icon: Icons.local_shipping_outlined,
        color: Color(0xFFEA580C),
      ),
      _QuickAction(
        title: 'Vendors',
        subtitle: 'Manage vendors',
        icon: Icons.business_outlined,
        color: Color(0xFF4F46E5),
      ),
      _QuickAction(
        title: 'Production',
        subtitle: 'Manage production',
        icon: Icons.precision_manufacturing_outlined,
        color: Color(0xFF9333EA),
      ),
      _QuickAction(
        title: 'Asset Management',
        subtitle: 'Manage assets',
        icon: Icons.business_center_outlined,
        color: Color(0xFF0F766E),
      ),
      _QuickAction(
        title: 'Maintenance',
        subtitle: 'Manage maintenance',
        icon: Icons.build_outlined,
        color: Color(0xFFB45309),
      ),
    ];

    return _Panel(
      title: 'Quick Actions',
      subtitle: 'Frequently used ERP operations',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double available = constraints.maxWidth;

          int columns;

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
              final double cardWidth = columns == 1
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

  const _BarChartPainter({required this.values, required this.labels});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) {
      return;
    }

    const double left = 35;
    const double right = 12;
    const double top = 20;
    const double bottom = 35;

    final double chartWidth = size.width - left - right;
    final double chartHeight = size.height - top - bottom;

    double maxValue = 0;

    for (final value in values) {
      if (value > maxValue) {
        maxValue = value;
      }
    }

    if (maxValue <= 0) {
      maxValue = 1;
    }

    final Paint gridPaint = Paint()
      ..color = const Color(0xFFE8EDF3)
      ..strokeWidth = 1;

    for (int i = 0; i <= 4; i++) {
      final double y = top + chartHeight - (chartHeight * i / 4);

      canvas.drawLine(
        Offset(left, y),
        Offset(size.width - right, y),
        gridPaint,
      );
    }

    final double slotWidth = chartWidth / values.length;
    final double barWidth = math.min(34, slotWidth * 0.50);

    final Paint barPaint = Paint()..color = const Color(0xFF2563EB);

    for (int i = 0; i < values.length; i++) {
      final double barHeight = values[i] / maxValue * chartHeight;

      final double x = left + slotWidth * i + (slotWidth - barWidth) / 2;

      final double y = top + chartHeight - barHeight;

      final Rect rect = Rect.fromLTWH(x, y, barWidth, barHeight);

      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(5)),
        barPaint,
      );

      final TextPainter valuePainter = TextPainter(
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

      final String label = i < labels.length ? labels[i] : '';

      final TextPainter labelPainter = TextPainter(
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

  const _PieChartPainter({
    required this.values,
    required this.colors,
    required this.centerValue,
    required this.centerLabel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty || colors.isEmpty) {
      return;
    }

    double total = 0;

    for (final value in values) {
      total += value;
    }

    if (total <= 0) {
      return;
    }

    final Offset center = Offset(size.width / 2, size.height / 2);

    final double radius = math.min(size.width, size.height) / 2 - 12;

    double startAngle = -math.pi / 2;

    for (int i = 0; i < values.length; i++) {
      final double sweep = values[i] / total * math.pi * 2;

      final Path path = Path();

      path.moveTo(center.dx, center.dy);

      const int segments = 50;

      for (int step = 0; step <= segments; step++) {
        final double angle = startAngle + sweep * step / segments;

        final double x = center.dx + math.cos(angle) * radius;

        final double y = center.dy + math.sin(angle) * radius;

        path.lineTo(x, y);
      }

      path.close();

      final Paint paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      canvas.drawPath(path, paint);

      startAngle += sweep;
    }

    final Paint centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.55, centerPaint);

    final TextPainter valuePainter = TextPainter(
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

    final TextPainter labelPainter = TextPainter(
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
