import 'package:flutter/material.dart';

import '../../app_theme.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const Text(
                'Features',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Everything you need to manage inventory and daily operations efficiently.',
                style: TextStyle(fontSize: 15, color: Color(0xFF737D8C)),
              ),

              const SizedBox(height: 30),

              LayoutBuilder(
                builder: (context, constraints) {
                  int columns;

                  if (constraints.maxWidth < 600) {
                    columns = 1;
                  } else if (constraints.maxWidth < 950) {
                    columns = 2;
                  } else {
                    columns = 3;
                  }

                  const double spacing = 18;

                  final double cardWidth =
                      (constraints.maxWidth - (spacing * (columns - 1))) /
                      columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      _featureCard(
                        width: cardWidth,
                        icon: Icons.inventory_2_outlined,
                        title: 'Inventory Management',
                        description: 'Track products, stock levels, SKUs and inventory availability from one place.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.warehouse_outlined,
                        title: 'Warehouse Management',
                        description: 'Manage multiple warehouses and maintain visibility of stock across locations.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.swap_horiz_rounded,
                        title: 'Stock Movements',
                        description: 'Monitor stock in, stock out, transfers and inventory adjustments.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.shopping_cart_outlined,
                        title: 'Procurement',
                        description: 'Create and manage purchase orders and monitor procurement progress.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.people_outline_rounded,
                        title: 'Vendor Management',
                        description: 'Keep vendor information organized and track purchasing relationships.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.receipt_long_outlined,
                        title: 'Sales Orders',
                        description: 'Create, track and manage customer sales orders through their lifecycle.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.local_shipping_outlined,
                        title: 'Dispatch',
                        description: 'Manage dispatches, shipments, tracking information and delivery status.',
                      ),

                      _featureCard(
                        width: cardWidth,
                        icon: Icons.dashboard_outlined,
                        title: 'Dashboard & Analytics',
                        description: 'Get a clear overview of inventory, orders, procurement and dispatch activity.',
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 35),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool compact = constraints.maxWidth < 500;

                    if (compact) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.auto_graph_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Everything connected in one system',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'From procurement to inventory, sales orders and dispatch, GT-InStock keeps your operations connected.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      );
                    }

                    return const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.auto_graph_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Everything connected in one system',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'From procurement to inventory, sales orders and dispatch, GT-InStock keeps your operations connected.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  static Widget _featureCard({
    required double width,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        constraints: const BoxConstraints(minHeight: 175),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE7EBF0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.primaryBlue, size: 24),
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.darkNavy,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Color(0xFF737D8C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
