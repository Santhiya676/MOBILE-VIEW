import 'package:flutter/material.dart';

import '../../app_theme.dart';

class StockMovementsPage extends StatefulWidget {
  const StockMovementsPage({super.key});

  @override
  State<StockMovementsPage> createState() => _StockMovementsPageState();
}

class _StockMovementsPageState extends State<StockMovementsPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedType = 'All Types';
  String selectedWarehouse = 'All Warehouses';

  final List<Map<String, dynamic>> movements = [
    {
      'id': 'MOV-2026-00124',
      'date': '09 Sep 2026',
      'time': '10:42 AM',
      'product': 'Wireless Keyboard',
      'sku': 'ELEC-KEY-001',
      'type': 'Stock In',
      'quantity': 120,
      'unit': 'pcs',
      'warehouse': 'Hyderabad Main',
      'from': '-',
      'to': 'Hyderabad Main',
      'reference': 'PO-2026-00418',
      'user': 'Ravi Kumar',
      'reason': 'Purchase Receipt',
    },
    {
      'id': 'MOV-2026-00123',
      'date': '09 Sep 2026',
      'time': '09:35 AM',
      'product': 'USB-C Cable',
      'sku': 'ACC-USBC-001',
      'type': 'Stock Out',
      'quantity': 45,
      'unit': 'pcs',
      'warehouse': 'Bangalore DC',
      'from': 'Bangalore DC',
      'to': '-',
      'reference': 'SO-2026-00871',
      'user': 'Arjun Rao',
      'reason': 'Sales Order',
    },
    {
      'id': 'MOV-2026-00122',
      'date': '09 Sep 2026',
      'time': '08:50 AM',
      'product': 'Network Switch 8-Port',
      'sku': 'NET-SW-001',
      'type': 'Transfer',
      'quantity': 20,
      'unit': 'pcs',
      'warehouse': 'Chennai Regional',
      'from': 'Hyderabad Main',
      'to': 'Chennai Regional',
      'reference': 'TRF-2026-00116',
      'user': 'Suresh Babu',
      'reason': 'Warehouse Transfer',
    },
    {
      'id': 'MOV-2026-00121',
      'date': '08 Sep 2026',
      'time': '05:25 PM',
      'product': 'Wireless Mouse',
      'sku': 'ELEC-MOU-001',
      'type': 'Adjustment',
      'quantity': 5,
      'unit': 'pcs',
      'warehouse': 'Hyderabad Main',
      'from': '-',
      'to': 'Hyderabad Main',
      'reference': 'ADJ-2026-00042',
      'user': 'Ravi Kumar',
      'reason': 'Stock Count Adjustment',
    },
    {
      'id': 'MOV-2026-00120',
      'date': '08 Sep 2026',
      'time': '04:10 PM',
      'product': 'Laptop Stand',
      'sku': 'OFF-STD-001',
      'type': 'Stock In',
      'quantity': 80,
      'unit': 'pcs',
      'warehouse': 'Bangalore DC',
      'from': '-',
      'to': 'Bangalore DC',
      'reference': 'PO-2026-00411',
      'user': 'Arjun Rao',
      'reason': 'Purchase Receipt',
    },
    {
      'id': 'MOV-2026-00119',
      'date': '08 Sep 2026',
      'time': '02:45 PM',
      'product': 'HDMI Cable 2M',
      'sku': 'ACC-HDMI-002',
      'type': 'Stock Out',
      'quantity': 25,
      'unit': 'pcs',
      'warehouse': 'Chennai Regional',
      'from': 'Chennai Regional',
      'to': '-',
      'reference': 'SO-2026-00864',
      'user': 'Suresh Babu',
      'reason': 'Sales Order',
    },
    {
      'id': 'MOV-2026-00118',
      'date': '08 Sep 2026',
      'time': '11:30 AM',
      'product': 'Ethernet Cable',
      'sku': 'NET-CAT6-001',
      'type': 'Transfer',
      'quantity': 100,
      'unit': 'pcs',
      'warehouse': 'Pune Storage',
      'from': 'Mumbai Fulfillment',
      'to': 'Pune Storage',
      'reference': 'TRF-2026-00114',
      'user': 'Kiran Patil',
      'reason': 'Warehouse Transfer',
    },
    {
      'id': 'MOV-2026-00117',
      'date': '07 Sep 2026',
      'time': '04:18 PM',
      'product': 'Bluetooth Speaker',
      'sku': 'ELEC-SPK-001',
      'type': 'Stock Out',
      'quantity': 18,
      'unit': 'pcs',
      'warehouse': 'Bangalore DC',
      'from': 'Bangalore DC',
      'to': '-',
      'reference': 'SO-2026-00851',
      'user': 'Arjun Rao',
      'reason': 'Sales Order',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool mobile = constraints.maxWidth < 850;

          final double horizontalPadding = mobile ? 16 : 28;
          final double topPadding = mobile ? 20 : 26;

          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    topPadding,
                    horizontalPadding,
                    0,
                  ),
                  child: _buildHeader(mobile),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      22,
                      horizontalPadding,
                      28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSummary(mobile),
                        const SizedBox(height: 22),

                        _buildMovementSection(mobile),
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


  Widget _buildHeader(bool mobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppTheme.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.swap_horizontal_circle_outlined,
                color: AppTheme.primaryBlue,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stock Movements',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.darkNavy,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Track receipts, issues, transfers and inventory adjustments.',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ),
            if (!mobile)
              OutlinedButton.icon(
                onPressed: _showMovementDialog,
                icon: const Icon(Icons.add, size: 17),
                label: const Text('Record Movement'),
                style: _outlineButtonStyle(),
              ),
          ],
        ),
        if (mobile) ...[
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _showMovementDialog,
              icon: const Icon(Icons.add, size: 17),
              label: const Text('Record Movement'),
              style: _primaryButtonStyle(),
            ),
          ),
        ],
      ],
    );
  }


  Widget _buildSummary(bool mobile) {
    final List<Map<String, dynamic>> data = [
      {
        'title': 'Stock In',
        'value': '200',
        'subtitle': 'Units received',
        'icon': Icons.arrow_downward,
        'color': const Color(0xFF16834B),
        'background': const Color(0xFFEAF8F0),
      },
      {
        'title': 'Stock Out',
        'value': '88',
        'subtitle': 'Units issued',
        'icon': Icons.arrow_upward,
        'color': const Color(0xFFC83C3C),
        'background': const Color(0xFFFFECEC),
      },
      {
        'title': 'Transfers',
        'value': '120',
        'subtitle': 'Units transferred',
        'icon': Icons.swap_horiz,
        'color': AppTheme.primaryBlue,
        'background': AppTheme.lightBlue,
      },
      {
        'title': 'Adjustments',
        'value': '5',
        'subtitle': 'Units adjusted',
        'icon': Icons.tune,
        'color': const Color(0xFFC17B00),
        'background': const Color(0xFFFFF5DF),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: mobile ? 2 : 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: mobile ? 1.5 : 2.1,
      ),
      itemBuilder: (context, index) {
        final item = data[index];

        return Container(
          padding: const EdgeInsets.all(15),
          decoration: _cardDecoration(),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: item['background'] as Color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: item['color'] as Color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'].toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['value'].toString(),
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['subtitle'].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildMovementSection(bool mobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(mobile),
          const SizedBox(height: 16),
          _filters(mobile),
          const SizedBox(height: 18),
          mobile ? _mobileMovements() : _desktopTable(),
        ],
      ),
    );
  }

  Widget _sectionHeader(bool mobile) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movement History',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Recent inventory activity across all warehouses',
                style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
        if (!mobile)
          Text(
            '9 movements',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
          ),
      ],
    );
  }


  Widget _filters(bool mobile) {
    if (mobile) {
      return Column(
        children: [
          _searchField(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _typeDropdown()),
              const SizedBox(width: 10),
              Expanded(child: _warehouseDropdown()),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(flex: 2, child: _searchField()),
        const SizedBox(width: 10),
        SizedBox(width: 160, child: _typeDropdown()),
        const SizedBox(width: 10),
        SizedBox(width: 190, child: _warehouseDropdown()),
      ],
    );
  }

  Widget _searchField() {
    return TextField(
      controller: searchController,
      onChanged: (_) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: 'Search product, SKU, movement ID or reference...',
        hintStyle: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
        prefixIcon: const Icon(Icons.search, size: 18),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _typeDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: selectedType,
      isExpanded: true,
      decoration: _dropdownDecoration(),
      style: const TextStyle(fontSize: 11, color: AppTheme.darkNavy),
      items:
          const [
            'All Types',
            'Stock In',
            'Stock Out',
            'Transfer',
            'Adjustment',
          ].map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectedType = value ?? 'All Types';
        });
      },
    );
  }

  Widget _warehouseDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: selectedWarehouse,
      isExpanded: true,
      decoration: _dropdownDecoration(),
      style: const TextStyle(fontSize: 11, color: AppTheme.darkNavy),
      items:
          const [
            'All Warehouses',
            'Hyderabad Main',
            'Bangalore DC',
            'Chennai Regional',
            'Pune Storage',
            'Mumbai Fulfillment',
          ].map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectedWarehouse = value ?? 'All Warehouses';
        });
      },
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
    );
  }


  Widget _desktopTable() {
    final List<Map<String, dynamic>> data = _filteredMovements();

    if (data.isEmpty) {
      return _emptyState();
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E9EE)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 46,
            dataRowMinHeight: 70,
            dataRowMaxHeight: 76,
            horizontalMargin: 16,
            columnSpacing: 22,
            headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
            columns: const [
              DataColumn(label: Text('MOVEMENT')),
              DataColumn(label: Text('PRODUCT')),
              DataColumn(label: Text('TYPE')),
              DataColumn(label: Text('QUANTITY')),
              DataColumn(label: Text('WAREHOUSE')),
              DataColumn(label: Text('REFERENCE')),
              DataColumn(label: Text('USER')),
              DataColumn(label: Text('')),
            ],
            rows: data.map((movement) {
              return DataRow(
                cells: [
                  DataCell(_movementIdCell(movement)),
                  DataCell(_productCell(movement)),
                  DataCell(_movementTypeBadge(movement['type'].toString())),
                  DataCell(_quantityCell(movement)),
                  DataCell(_warehouseCell(movement)),
                  DataCell(
                    Text(
                      movement['reference'].toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      movement['user'].toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ),
                  DataCell(
                    IconButton(
                      onPressed: () {
                        _showMovementDetails(movement);
                      },
                      icon: const Icon(Icons.more_vert, size: 18),
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

  Widget _movementIdCell(Map<String, dynamic> movement) {
    return SizedBox(
      width: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movement['id'].toString(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            movement['date'].toString(),
            style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
          ),
          Text(
            movement['time'].toString(),
            style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _productCell(Map<String, dynamic> movement) {
    return SizedBox(
      width: 190,
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              size: 17,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movement['product'].toString(),
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
                  movement['sku'].toString(),
                  style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityCell(Map<String, dynamic> movement) {
    final String type = movement['type'].toString();

    Color color;

    if (type == 'Stock In') {
      color = const Color(0xFF16834B);
    } else if (type == 'Stock Out') {
      color = const Color(0xFFC83C3C);
    } else if (type == 'Transfer') {
      color = AppTheme.primaryBlue;
    } else {
      color = const Color(0xFFC17B00);
    }

    final String prefix = type == 'Stock Out' ? '-' : '+';

    return Text(
      '$prefix${movement['quantity']} ${movement['unit']}',
      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: color),
    );
  }

  Widget _warehouseCell(Map<String, dynamic> movement) {
    return SizedBox(
      width: 135,
      child: Row(
        children: [
          Icon(Icons.warehouse_outlined, size: 14, color: Colors.grey.shade500),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              movement['warehouse'].toString(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10, color: Color(0xFF475569)),
            ),
          ),
        ],
      ),
    );
  }


  Widget _mobileMovements() {
    final List<Map<String, dynamic>> data = _filteredMovements();

    if (data.isEmpty) {
      return _emptyState();
    }

    return Column(
      children: data.map((movement) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _mobileMovementCard(movement),
        );
      }).toList(),
    );
  }

  Widget _mobileMovementCard(Map<String, dynamic> movement) {
    return InkWell(
      onTap: () {
        _showMovementDetails(movement);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFBFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E9EE)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.lightBlue,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.inventory_2_outlined,
                    color: AppTheme.primaryBlue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movement['product'].toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.darkNavy,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        movement['id'].toString(),
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                _movementTypeBadge(movement['type'].toString()),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _mobileInfo(
                    'Quantity',
                    '${movement['quantity']} ${movement['unit']}',
                    Icons.numbers_outlined,
                  ),
                ),
                Expanded(
                  child: _mobileInfo(
                    'Warehouse',
                    movement['warehouse'].toString(),
                    Icons.warehouse_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                  child: _mobileInfo(
                    'Reference',
                    movement['reference'].toString(),
                    Icons.receipt_long_outlined,
                  ),
                ),
                Expanded(
                  child: _mobileInfo(
                    'User',
                    movement['user'].toString(),
                    Icons.person_outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 5),
                Text(
                  '${movement['date']} • ${movement['time']}',
                  style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobileInfo(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade500),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 8, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
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


  Widget _movementTypeBadge(String type) {
    Color background;
    Color foreground;
    IconData icon;

    switch (type) {
      case 'Stock In':
        background = const Color(0xFFEAF8F0);
        foreground = const Color(0xFF16834B);
        icon = Icons.arrow_downward;
        break;

      case 'Stock Out':
        background = const Color(0xFFFFECEC);
        foreground = const Color(0xFFC83C3C);
        icon = Icons.arrow_upward;
        break;

      case 'Transfer':
        background = AppTheme.lightBlue;
        foreground = AppTheme.primaryBlue;
        icon = Icons.swap_horiz;
        break;

      default:
        background = const Color(0xFFFFF5DF);
        foreground = const Color(0xFFC17B00);
        icon = Icons.tune;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: foreground),
          const SizedBox(width: 4),
          Text(
            type,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }


  List<Map<String, dynamic>> _filteredMovements() {
    final String query = searchController.text.trim().toLowerCase();

    return movements.where((movement) {
      final bool matchesSearch =
          query.isEmpty ||
          movement['id'].toString().toLowerCase().contains(query) ||
          movement['product'].toString().toLowerCase().contains(query) ||
          movement['sku'].toString().toLowerCase().contains(query) ||
          movement['reference'].toString().toLowerCase().contains(query) ||
          movement['user'].toString().toLowerCase().contains(query);

      final bool matchesType =
          selectedType == 'All Types' || movement['type'] == selectedType;

      final bool matchesWarehouse =
          selectedWarehouse == 'All Warehouses' ||
          movement['warehouse'] == selectedWarehouse;

      return matchesSearch && matchesType && matchesWarehouse;
    }).toList();
  }


  void _showMovementDetails(Map<String, dynamic> movement) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            movement['id'].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppTheme.darkNavy,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _detailRow('Product', movement['product'].toString()),
              _detailRow('SKU', movement['sku'].toString()),
              _detailRow('Movement Type', movement['type'].toString()),
              _detailRow(
                'Quantity',
                '${movement['quantity']} ${movement['unit']}',
              ),
              _detailRow('Warehouse', movement['warehouse'].toString()),
              _detailRow('From', movement['from'].toString()),
              _detailRow('To', movement['to'].toString()),
              _detailRow('Reference', movement['reference'].toString()),
              _detailRow('Reason', movement['reason'].toString()),
              _detailRow('Performed By', movement['user'].toString()),
              _detailRow('Date', '${movement['date']} ${movement['time']}'),
              const SizedBox(height: 8),
              _movementTypeBadge(movement['type'].toString()),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showMovementDialog() {
    final TextEditingController productController = TextEditingController();

    final TextEditingController skuController = TextEditingController();

    final TextEditingController quantityController = TextEditingController();

    String movementType = 'Stock In';

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Record Stock Movement',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),
              content: SizedBox(
                width: 430,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        initialValue: movementType,
                        decoration: _dialogDecoration(
                          'Movement Type',
                          Icons.swap_horiz,
                        ),
                        items:
                            const [
                              'Stock In',
                              'Stock Out',
                              'Transfer',
                              'Adjustment',
                            ].map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setDialogState(() {
                            movementType = value ?? 'Stock In';
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      _dialogField(
                        productController,
                        'Product',
                        Icons.inventory_2_outlined,
                      ),
                      const SizedBox(height: 12),
                      _dialogField(
                        skuController,
                        'SKU',
                        Icons.qr_code_2_outlined,
                      ),
                      const SizedBox(height: 12),
                      _dialogField(
                        quantityController,
                        'Quantity',
                        Icons.numbers_outlined,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);

                    ScaffoldMessenger.of(this.context).showSnackBar(
                      const SnackBar(
                        content: Text('Stock movement recorded successfully.'),
                      ),
                    );
                  },
                  style: _primaryButtonStyle(),
                  child: const Text('Record Movement'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _dialogField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _dialogDecoration(label, icon),
    );
  }

  InputDecoration _dialogDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 19),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }


  Widget _emptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Icon(
            Icons.swap_horizontal_circle_outlined,
            size: 48,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 12),
          const Text(
            'No movements found',
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


  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE4E8ED)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.025),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  ButtonStyle _primaryButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppTheme.primaryBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    );
  }

  ButtonStyle _outlineButtonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppTheme.darkNavy,
      side: BorderSide(color: Colors.grey.shade300),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    );
  }
}
