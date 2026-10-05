import 'package:flutter/material.dart';

import '../../app_theme.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final TextEditingController _searchController = TextEditingController();

  String selectedCategory = 'All Categories';
  String selectedStatus = 'All Status';

  final List<Map<String, dynamic>> inventoryItems = [
    {
      'sku': 'SKU-1001',
      'name': 'Wireless Keyboard',
      'category': 'Electronics',
      'warehouse': 'Hyderabad WH',
      'quantity': 145,
      'reorder': 50,
      'unit': 'pcs',
      'status': 'In Stock',
      'value': 36250,
    },
    {
      'sku': 'SKU-1002',
      'name': 'Wireless Mouse',
      'category': 'Electronics',
      'warehouse': 'Hyderabad WH',
      'quantity': 38,
      'reorder': 40,
      'unit': 'pcs',
      'status': 'Low Stock',
      'value': 7600,
    },
    {
      'sku': 'SKU-1003',
      'name': 'USB-C Cable',
      'category': 'Accessories',
      'warehouse': 'Bangalore WH',
      'quantity': 420,
      'reorder': 100,
      'unit': 'pcs',
      'status': 'In Stock',
      'value': 21000,
    },
    {
      'sku': 'SKU-1004',
      'name': 'HDMI Cable 2M',
      'category': 'Accessories',
      'warehouse': 'Chennai WH',
      'quantity': 74,
      'reorder': 80,
      'unit': 'pcs',
      'status': 'Low Stock',
      'value': 9250,
    },
    {
      'sku': 'SKU-1005',
      'name': '24" LED Monitor',
      'category': 'Displays',
      'warehouse': 'Hyderabad WH',
      'quantity': 0,
      'reorder': 20,
      'unit': 'pcs',
      'status': 'Out of Stock',
      'value': 0,
    },
    {
      'sku': 'SKU-1006',
      'name': 'Laptop Stand',
      'category': 'Office',
      'warehouse': 'Bangalore WH',
      'quantity': 96,
      'reorder': 30,
      'unit': 'pcs',
      'status': 'In Stock',
      'value': 28800,
    },
    {
      'sku': 'SKU-1007',
      'name': 'Ethernet Cable',
      'category': 'Networking',
      'warehouse': 'Chennai WH',
      'quantity': 215,
      'reorder': 75,
      'unit': 'pcs',
      'status': 'In Stock',
      'value': 10750,
    },
    {
      'sku': 'SKU-1008',
      'name': 'Network Switch 8-Port',
      'category': 'Networking',
      'warehouse': 'Hyderabad WH',
      'quantity': 18,
      'reorder': 25,
      'unit': 'pcs',
      'status': 'Low Stock',
      'value': 23400,
    },
    {
      'sku': 'SKU-1009',
      'name': 'Bluetooth Speaker',
      'category': 'Electronics',
      'warehouse': 'Bangalore WH',
      'quantity': 62,
      'reorder': 25,
      'unit': 'pcs',
      'status': 'In Stock',
      'value': 18600,
    },
    {
      'sku': 'SKU-1010',
      'name': 'Power Adapter',
      'category': 'Accessories',
      'warehouse': 'Chennai WH',
      'quantity': 7,
      'reorder': 15,
      'unit': 'pcs',
      'status': 'Low Stock',
      'value': 3500,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 750;

          final horizontalPadding = isMobile ? 16.0 : 28.0;

          return SafeArea(
            bottom: false,
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    isMobile ? 20 : 28,
                    horizontalPadding,
                    0,
                  ),
                  child: _buildPageHeader(isMobile),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      24,
                      horizontalPadding,
                      28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSummaryCards(isMobile),

                        const SizedBox(height: 24),

                        _buildInventoryHealth(isMobile),

                        const SizedBox(height: 24),

                        _buildInventoryTable(isMobile),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildPageHeader(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderTitle(),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _showAddItemDialog,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Inventory Item'),
              style: _primaryButtonStyle(),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: _buildHeaderTitle()),
        ElevatedButton.icon(
          onPressed: _showAddItemDialog,
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Add Inventory Item'),
          style: _primaryButtonStyle(),
        ),
      ],
    );
  }

  Widget _buildHeaderTitle() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryBlue,
                AppTheme.primaryBlue.withValues(alpha: .78),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlue.withValues(alpha: .18),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(
            Icons.inventory_2_outlined,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inventory',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Manage products, stock levels and inventory across warehouses.',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildSummaryCards(bool mobile) {
    final cards = [
      _summaryCard(
        title: 'Total Items',
        value: '10',
        subtitle: 'Active SKUs',
        icon: Icons.inventory_2_outlined,
      ),
      _summaryCard(
        title: 'Total Units',
        value: '1,075',
        subtitle: 'Across warehouses',
        icon: Icons.stacked_bar_chart_rounded,
      ),
      _summaryCard(
        title: 'Low Stock',
        value: '4',
        subtitle: 'Needs attention',
        icon: Icons.warning_amber_rounded,
        alert: true,
      ),
      _summaryCard(
        title: 'Inventory Value',
        value: '₹1.59L',
        subtitle: 'Current stock value',
        icon: Icons.currency_rupee_rounded,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: mobile ? 2 : 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: mobile ? 1.25 : 1.85,
      ),
      itemBuilder: (_, index) => cards[index],
    );
  }

  Widget _summaryCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    bool alert = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: alert ? const Color(0xFFFFF7E8) : AppTheme.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: alert ? const Color(0xFFD98B00) : AppTheme.primaryBlue,
                ),
              ),
              const Spacer(),
              Icon(Icons.more_horiz, size: 20, color: Colors.grey.shade400),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }


  Widget _buildInventoryHealth(bool mobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Inventory Health',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Current stock availability overview',
                      style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFFAF3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Color(0xFF1E9E5A),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Healthy',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E9E5A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          if (mobile)
            Column(
              children: [
                _healthItem('In Stock', '60%', .60, const Color(0xFF1E9E5A)),
                const SizedBox(height: 16),
                _healthItem('Low Stock', '30%', .30, const Color(0xFFE5A100)),
                const SizedBox(height: 16),
                _healthItem(
                  'Out of Stock',
                  '10%',
                  .10,
                  const Color(0xFFD94A4A),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: _healthItem(
                    'In Stock',
                    '60%',
                    .60,
                    const Color(0xFF1E9E5A),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _healthItem(
                    'Low Stock',
                    '30%',
                    .30,
                    const Color(0xFFE5A100),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _healthItem(
                    'Out of Stock',
                    '10%',
                    .10,
                    const Color(0xFFD94A4A),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _healthItem(
    String title,
    String percentage,
    double progress,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.darkNavy,
              ),
            ),
            const Spacer(),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            backgroundColor: const Color(0xFFE8EDF3),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }


  Widget _buildInventoryTable(bool mobile) {
    return Container(
      width: double.infinity,
      decoration: _cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTableHeader(mobile),
            const SizedBox(height: 18),
            _buildFilters(mobile),
            const SizedBox(height: 18),
            mobile ? _buildMobileInventoryList() : _buildDesktopTable(),
            const SizedBox(height: 10),
            _buildPagination(),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(bool mobile) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inventory Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'View and manage your current inventory',
                style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
        if (!mobile)
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download_outlined, size: 17),
            label: const Text('Export'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.darkNavy,
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildFilters(bool mobile) {
    if (mobile) {
      return Column(
        children: [
          _searchField(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _categoryDropdown()),
              const SizedBox(width: 10),
              Expanded(child: _statusDropdown()),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(flex: 2, child: _searchField()),
        const SizedBox(width: 12),
        SizedBox(width: 190, child: _categoryDropdown()),
        const SizedBox(width: 12),
        SizedBox(width: 170, child: _statusDropdown()),
      ],
    );
  }

  Widget _searchField() {
    return TextField(
      controller: _searchController,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: 'Search by product, SKU or warehouse...',
        hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
        prefixIcon: const Icon(Icons.search, size: 19),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _categoryDropdown() {
    return _dropdown(
      value: selectedCategory,
      items: const [
        'All Categories',
        'Electronics',
        'Accessories',
        'Displays',
        'Office',
        'Networking',
      ],
      onChanged: (value) {
        setState(() {
          selectedCategory = value!;
        });
      },
    );
  }

  Widget _statusDropdown() {
    return _dropdown(
      value: selectedStatus,
      items: const ['All Status', 'In Stock', 'Low Stock', 'Out of Stock'],
      onChanged: (value) {
        setState(() {
          selectedStatus = value!;
        });
      },
    );
  }

  Widget _dropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        fontSize: 12,
        color: AppTheme.darkNavy,
        fontWeight: FontWeight.w500,
      ),
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(item, overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }


  Widget _buildDesktopTable() {
    final items = _filteredItems();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE7EBF0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 48,
            dataRowMinHeight: 70,
            dataRowMaxHeight: 78,
            horizontalMargin: 18,
            columnSpacing: 25,
            headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
            columns: const [
              DataColumn(label: Text('PRODUCT')),
              DataColumn(label: Text('CATEGORY')),
              DataColumn(label: Text('WAREHOUSE')),
              DataColumn(label: Text('STOCK LEVEL')),
              DataColumn(label: Text('STATUS')),
              DataColumn(label: Text('VALUE')),
              DataColumn(label: Text('')),
            ],
            rows: items.map((item) {
              return DataRow(
                cells: [
                  DataCell(_productCell(item)),
                  DataCell(_categoryCell(item['category'])),
                  DataCell(_warehouseCell(item['warehouse'])),
                  DataCell(
                    _stockLevel(
                      item['quantity'],
                      item['reorder'],
                      item['unit'],
                    ),
                  ),
                  DataCell(_statusBadge(item['status'])),
                  DataCell(
                    Text(
                      _currency(item['value']),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                  ),
                  DataCell(
                    IconButton(
                      onPressed: () => _showItemDetails(item),
                      icon: const Icon(Icons.more_vert, size: 19),
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _productCell(Map<String, dynamic> item) {
    return SizedBox(
      width: 210,
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              size: 19,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item['sku'],
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCell(String category) {
    return Text(
      category,
      style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
    );
  }

  Widget _warehouseCell(String warehouse) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.warehouse_outlined, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 6),
        Text(
          warehouse,
          style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
        ),
      ],
    );
  }

  Widget _stockLevel(int quantity, int reorder, String unit) {
    final max = reorder * 4;
    final progress = (quantity / max).clamp(0.0, 1.0);

    Color color;

    if (quantity == 0) {
      color = const Color(0xFFD94A4A);
    } else if (quantity <= reorder) {
      color = const Color(0xFFE5A100);
    } else {
      color = const Color(0xFF1E9E5A);
    }

    return SizedBox(
      width: 145,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                '$quantity $unit',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              const Spacer(),
              Text(
                'Min $reorder',
                style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: const Color(0xFFE9EEF3),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMobileInventoryList() {
    final items = _filteredItems();

    if (items.isEmpty) {
      return _emptyState();
    }

    return Column(
      children: items.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFBFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE8ECF1)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppTheme.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: AppTheme.primaryBlue,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.darkNavy,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item['sku'],
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _statusBadge(item['status']),
                ],
              ),
              const SizedBox(height: 14),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _mobileInfo(
                      'Warehouse',
                      item['warehouse'],
                      Icons.warehouse_outlined,
                    ),
                  ),
                  Expanded(
                    child: _mobileInfo(
                      'Category',
                      item['category'],
                      Icons.category_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _stockLevel(item['quantity'], item['reorder'], item['unit']),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    'Stock Value',
                    style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                  ),
                  const Spacer(),
                  Text(
                    _currency(item['value']),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.darkNavy,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _showItemDetails(item),
                    icon: const Icon(Icons.more_vert, size: 19),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _mobileInfo(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.grey.shade500),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkNavy,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _statusBadge(String status) {
    Color background;
    Color foreground;
    IconData icon;

    switch (status) {
      case 'In Stock':
        background = const Color(0xFFEAF8F0);
        foreground = const Color(0xFF16834B);
        icon = Icons.check_circle_outline;
        break;

      case 'Low Stock':
        background = const Color(0xFFFFF5DF);
        foreground = const Color(0xFFC17B00);
        icon = Icons.warning_amber_outlined;
        break;

      default:
        background = const Color(0xFFFFECEC);
        foreground = const Color(0xFFC83C3C);
        icon = Icons.remove_circle_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: foreground),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPagination() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Showing ${_filteredItems().length} of ${inventoryItems.length} items',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.chevron_left, size: 19, color: Colors.grey.shade400),
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue,
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Text(
            '1',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.chevron_right,
            size: 19,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }


  List<Map<String, dynamic>> _filteredItems() {
    final query = _searchController.text.trim().toLowerCase();

    return inventoryItems.where((item) {
      final matchesSearch =
          query.isEmpty ||
          item['name'].toString().toLowerCase().contains(query) ||
          item['sku'].toString().toLowerCase().contains(query) ||
          item['warehouse'].toString().toLowerCase().contains(query);

      final matchesCategory =
          selectedCategory == 'All Categories' ||
          item['category'] == selectedCategory;

      final matchesStatus =
          selectedStatus == 'All Status' || item['status'] == selectedStatus;

      return matchesSearch && matchesCategory && matchesStatus;
    }).toList();
  }


  void _showAddItemDialog() {
    final nameController = TextEditingController();
    final skuController = TextEditingController();
    final quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Add Inventory Item',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          content: SizedBox(
            width: 430,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: _dialogInput(
                    'Product Name',
                    Icons.inventory_2_outlined,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: skuController,
                  decoration: _dialogInput('SKU', Icons.qr_code_2_outlined),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: _dialogInput(
                    'Opening Quantity',
                    Icons.numbers_outlined,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Inventory item added successfully.'),
                  ),
                );
              },
              style: _primaryButtonStyle(),
              child: const Text('Add Item'),
            ),
          ],
        );
      },
    );
  }

  void _showItemDetails(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            item['name'],
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _detailRow('SKU', item['sku']),
              _detailRow('Category', item['category']),
              _detailRow('Warehouse', item['warehouse']),
              _detailRow(
                'Available Stock',
                '${item['quantity']} ${item['unit']}',
              ),
              _detailRow('Reorder Level', '${item['reorder']} ${item['unit']}'),
              _detailRow('Inventory Value', _currency(item['value'])),
              const SizedBox(height: 8),
              _statusBadge(item['status']),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const Spacer(),
          Text(
            value,
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

  InputDecoration _dialogInput(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 19),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }


  ButtonStyle _primaryButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppTheme.primaryBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE6EAF0)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .025),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  Widget _emptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45),
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 45, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          const Text(
            'No inventory items found',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Try changing your search or filter selection.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  String _currency(dynamic value) {
    final amount = value is int ? value : int.tryParse(value.toString()) ?? 0;

    if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(2)}L';
    }

    if (amount >= 1000) {
      return '₹${(amount / 1000).toStringAsFixed(1)}K';
    }

    return '₹$amount';
  }
}
