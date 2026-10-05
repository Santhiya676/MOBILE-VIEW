import 'package:flutter/material.dart';

import '../../app_theme.dart';

class WarehousesPage extends StatefulWidget {
  const WarehousesPage({super.key});

  @override
  State<WarehousesPage> createState() => _WarehousesPageState();
}

class _WarehousesPageState extends State<WarehousesPage> {
  final TextEditingController searchController = TextEditingController();

  String selectedStatus = 'All';

  final List<Map<String, dynamic>> warehouses = [
    {
      'code': 'WH-HYD-01',
      'name': 'Hyderabad Main Warehouse',
      'location': 'Hyderabad, Telangana',
      'manager': 'Ravi Kumar',
      'type': 'Main Warehouse',
      'capacity': 10000,
      'occupied': 7200,
      'sku': 385,
      'stock': 6850000,
      'status': 'Active',
      'updated': 'Today, 10:42 AM',
    },
    {
      'code': 'WH-BLR-01',
      'name': 'Bangalore Distribution Center',
      'location': 'Bangalore, Karnataka',
      'manager': 'Arjun Rao',
      'type': 'Distribution Center',
      'capacity': 8000,
      'occupied': 4800,
      'sku': 274,
      'stock': 4250000,
      'status': 'Active',
      'updated': 'Today, 09:18 AM',
    },
    {
      'code': 'WH-CHE-01',
      'name': 'Chennai Regional Warehouse',
      'location': 'Chennai, Tamil Nadu',
      'manager': 'Suresh Babu',
      'type': 'Regional Warehouse',
      'capacity': 6500,
      'occupied': 5850,
      'sku': 218,
      'stock': 3180000,
      'status': 'Active',
      'updated': 'Yesterday, 06:35 PM',
    },
    {
      'code': 'WH-PUN-01',
      'name': 'Pune Storage Facility',
      'location': 'Pune, Maharashtra',
      'manager': 'Kiran Patil',
      'type': 'Storage Facility',
      'capacity': 5000,
      'occupied': 1600,
      'sku': 96,
      'stock': 1450000,
      'status': 'Active',
      'updated': 'Yesterday, 04:12 PM',
    },
    {
      'code': 'WH-DEL-01',
      'name': 'Delhi Regional Warehouse',
      'location': 'New Delhi, Delhi',
      'manager': 'Amit Sharma',
      'type': 'Regional Warehouse',
      'capacity': 7000,
      'occupied': 0,
      'sku': 0,
      'stock': 0,
      'status': 'Inactive',
      'updated': '12 Aug 2026',
    },
    {
      'code': 'WH-MUM-01',
      'name': 'Mumbai Fulfillment Center',
      'location': 'Mumbai, Maharashtra',
      'manager': 'Vikram Shah',
      'type': 'Fulfillment Center',
      'capacity': 9000,
      'occupied': 8100,
      'sku': 341,
      'stock': 5920000,
      'status': 'Active',
      'updated': 'Today, 11:05 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool mobile = constraints.maxWidth < 850;

          final double horizontalPadding = mobile ? 16 : 28;
          final double topPadding = mobile ? 20 : 28;

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
                        _buildKpiSection(mobile),
                        const SizedBox(height: 22),

                        _buildCapacitySection(mobile),
                        const SizedBox(height: 22),

                        _buildWarehouseSection(mobile),
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
                Icons.warehouse_outlined,
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
                    'Warehouses',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.darkNavy,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Manage warehouse locations, capacity and stock distribution.',
                    style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ),
            if (!mobile)
              ElevatedButton.icon(
                onPressed: _showAddWarehouseDialog,
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add Warehouse'),
                style: _primaryButtonStyle(),
              ),
          ],
        ),
        if (mobile) ...[
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _showAddWarehouseDialog,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Warehouse'),
              style: _primaryButtonStyle(),
            ),
          ),
        ],
      ],
    );
  }


  Widget _buildKpiSection(bool mobile) {
    final List<Map<String, dynamic>> data = [
      {'title': 'Warehouses', 'value': '6', 'icon': Icons.warehouse_outlined},
      {'title': 'Active', 'value': '5', 'icon': Icons.check_circle_outline},
      {
        'title': 'Total Capacity',
        'value': '45.5K',
        'icon': Icons.storage_outlined,
      },
      {
        'title': 'Used Capacity',
        'value': '27.5K',
        'icon': Icons.bar_chart_outlined,
      },
      {
        'title': 'Stock Value',
        'value': '₹2.18Cr',
        'icon': Icons.currency_rupee,
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: _cardDecoration(),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: mobile ? 2 : 5,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: mobile ? 2.3 : 2.5,
        ),
        itemBuilder: (context, index) {
          final item = data[index];

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Icon(
                  item['icon'] as IconData,
                  size: 20,
                  color: AppTheme.primaryBlue,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['value'].toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.darkNavy,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildCapacitySection(bool mobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
                      'Capacity Overview',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Current storage utilization by warehouse',
                      style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
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
                  color: AppTheme.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '60.4% Overall',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (mobile)
            Column(
              children: [
                _capacityRow(warehouses[0]),
                const SizedBox(height: 16),
                _capacityRow(warehouses[1]),
                const SizedBox(height: 16),
                _capacityRow(warehouses[2]),
              ],
            )
          else
            Row(
              children: [
                Expanded(child: _capacityRow(warehouses[0])),
                const SizedBox(width: 24),
                Expanded(child: _capacityRow(warehouses[1])),
                const SizedBox(width: 24),
                Expanded(child: _capacityRow(warehouses[2])),
              ],
            ),
        ],
      ),
    );
  }

  Widget _capacityRow(Map<String, dynamic> warehouse) {
    final int capacity = warehouse['capacity'] as int;
    final int occupied = warehouse['occupied'] as int;

    double percentage = 0;

    if (capacity > 0) {
      percentage = occupied / capacity;
    }

    Color progressColor;

    if (percentage >= 0.85) {
      progressColor = const Color(0xFFD94A4A);
    } else if (percentage >= 0.65) {
      progressColor = const Color(0xFFE09A00);
    } else {
      progressColor = const Color(0xFF1D9959);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                warehouse['name'].toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkNavy,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${(percentage * 100).round()}%',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: progressColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 6,
            backgroundColor: const Color(0xFFE8EDF2),
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${_formatNumber(occupied)} / ${_formatNumber(capacity)} units',
          style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
        ),
      ],
    );
  }


  Widget _buildWarehouseSection(bool mobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _warehouseSectionHeader(mobile),
          const SizedBox(height: 16),
          _buildFilters(mobile),
          const SizedBox(height: 18),
          mobile ? _buildMobileList() : _buildDesktopTable(),
        ],
      ),
    );
  }

  Widget _warehouseSectionHeader(bool mobile) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Warehouse Directory',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'All configured storage and distribution locations',
                style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
        if (!mobile)
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Export feature will be connected later.'),
                ),
              );
            },
            icon: const Icon(Icons.file_download_outlined, size: 17),
            label: const Text('Export'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.darkNavy,
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
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
          _statusDropdown(),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: _searchField()),
        const SizedBox(width: 12),
        SizedBox(width: 170, child: _statusDropdown()),
      ],
    );
  }

  Widget _searchField() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: 'Search warehouse, code, location or manager...',
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

  Widget _statusDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: selectedStatus,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 11,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(fontSize: 11, color: AppTheme.darkNavy),
      items: const [
        DropdownMenuItem(value: 'All', child: Text('All Status')),
        DropdownMenuItem(value: 'Active', child: Text('Active')),
        DropdownMenuItem(value: 'Inactive', child: Text('Inactive')),
      ],
      onChanged: (value) {
        setState(() {
          selectedStatus = value ?? 'All';
        });
      },
    );
  }


  Widget _buildDesktopTable() {
    final List<Map<String, dynamic>> data = _filteredWarehouses();

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
            dataRowMaxHeight: 78,
            horizontalMargin: 16,
            columnSpacing: 22,
            headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
            columns: const [
              DataColumn(label: Text('WAREHOUSE')),
              DataColumn(label: Text('LOCATION')),
              DataColumn(label: Text('MANAGER')),
              DataColumn(label: Text('CAPACITY')),
              DataColumn(label: Text('SKUs')),
              DataColumn(label: Text('STOCK VALUE')),
              DataColumn(label: Text('STATUS')),
              DataColumn(label: Text('')),
            ],
            rows: data.map((warehouse) {
              return DataRow(
                cells: [
                  DataCell(_warehouseNameCell(warehouse)),
                  DataCell(_locationCell(warehouse)),
                  DataCell(_managerCell(warehouse)),
                  DataCell(_capacityCell(warehouse)),
                  DataCell(
                    Text(
                      _formatNumber(warehouse['sku'] as int),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      _currency(warehouse['stock']),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                  ),
                  DataCell(_statusBadge(warehouse['status'].toString())),
                  DataCell(
                    IconButton(
                      onPressed: () {
                        _showWarehouseDetails(warehouse);
                      },
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

  Widget _warehouseNameCell(Map<String, dynamic> warehouse) {
    return SizedBox(
      width: 205,
      child: Row(
        children: [
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.warehouse_outlined,
              size: 18,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  warehouse['name'].toString(),
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
                  warehouse['code'].toString(),
                  style: TextStyle(fontSize: 9, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationCell(Map<String, dynamic> warehouse) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 15,
            color: Colors.grey.shade500,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              warehouse['location'].toString(),
              style: const TextStyle(fontSize: 11, color: Color(0xFF475569)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _managerCell(Map<String, dynamic> warehouse) {
    final String manager = warehouse['manager'].toString();

    return SizedBox(
      width: 125,
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppTheme.lightBlue,
            child: Text(
              manager.substring(0, 1),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              manager,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Color(0xFF475569)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _capacityCell(Map<String, dynamic> warehouse) {
    final int capacity = warehouse['capacity'] as int;
    final int occupied = warehouse['occupied'] as int;

    double percentage = 0;

    if (capacity > 0) {
      percentage = occupied / capacity;
    }

    Color color;

    if (percentage >= 0.85) {
      color = const Color(0xFFD94A4A);
    } else if (percentage >= 0.65) {
      color = const Color(0xFFE09A00);
    } else {
      color = const Color(0xFF1D9959);
    }

    return SizedBox(
      width: 135,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${(percentage * 100).round()}%',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
              const Spacer(),
              Text(
                '${_formatNumber(occupied)} / ${_formatNumber(capacity)}',
                style: TextStyle(fontSize: 8, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 5,
              backgroundColor: const Color(0xFFE7ECF1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMobileList() {
    final List<Map<String, dynamic>> data = _filteredWarehouses();

    if (data.isEmpty) {
      return _emptyState();
    }

    return Column(
      children: data.map((warehouse) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _mobileWarehouseCard(warehouse),
        );
      }).toList(),
    );
  }

  Widget _mobileWarehouseCard(Map<String, dynamic> warehouse) {
    final int capacity = warehouse['capacity'] as int;
    final int occupied = warehouse['occupied'] as int;

    double percentage = 0;

    if (capacity > 0) {
      percentage = occupied / capacity;
    }

    Color progressColor;

    if (percentage >= 0.85) {
      progressColor = const Color(0xFFD94A4A);
    } else if (percentage >= 0.65) {
      progressColor = const Color(0xFFE09A00);
    } else {
      progressColor = const Color(0xFF1D9959);
    }

    return InkWell(
      onTap: () {
        _showWarehouseDetails(warehouse);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFBFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E9EE)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    Icons.warehouse_outlined,
                    color: AppTheme.primaryBlue,
                    size: 21,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        warehouse['name'].toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.darkNavy,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        warehouse['code'].toString(),
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                _statusBadge(warehouse['status'].toString()),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _mobileMetric(
                    'Location',
                    warehouse['location'].toString(),
                    Icons.location_on_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _mobileMetric(
                    'Manager',
                    warehouse['manager'].toString(),
                    Icons.person_outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _mobileMetric(
                    'SKUs',
                    _formatNumber(warehouse['sku'] as int),
                    Icons.inventory_2_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _mobileMetric(
                    'Stock Value',
                    _currency(warehouse['stock']),
                    Icons.currency_rupee,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Capacity Utilization',
                    style: TextStyle(fontSize: 10, color: Color(0xFF64748B)),
                  ),
                ),
                Text(
                  '${(percentage * 100).round()}%',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: progressColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: percentage,
                minHeight: 6,
                backgroundColor: const Color(0xFFE7ECF1),
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobileMetric(String label, String value, IconData icon) {
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


  Widget _statusBadge(String status) {
    final bool active = status == 'Active';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFEAF8F0) : const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            active ? Icons.check_circle_outline : Icons.pause_circle_outline,
            size: 12,
            color: active ? const Color(0xFF16834B) : const Color(0xFF64748B),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: active ? const Color(0xFF16834B) : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }


  List<Map<String, dynamic>> _filteredWarehouses() {
    final String query = searchController.text.trim().toLowerCase();

    return warehouses.where((warehouse) {
      final bool matchesSearch =
          query.isEmpty ||
          warehouse['name'].toString().toLowerCase().contains(query) ||
          warehouse['code'].toString().toLowerCase().contains(query) ||
          warehouse['location'].toString().toLowerCase().contains(query) ||
          warehouse['manager'].toString().toLowerCase().contains(query);

      final bool matchesStatus =
          selectedStatus == 'All' || warehouse['status'] == selectedStatus;

      return matchesSearch && matchesStatus;
    }).toList();
  }


  void _showAddWarehouseDialog() {
    final TextEditingController nameController = TextEditingController();

    final TextEditingController codeController = TextEditingController();

    final TextEditingController locationController = TextEditingController();

    final TextEditingController managerController = TextEditingController();

    final TextEditingController capacityController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Add Warehouse',
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
                  _dialogField(
                    controller: nameController,
                    label: 'Warehouse Name',
                    icon: Icons.warehouse_outlined,
                  ),
                  const SizedBox(height: 12),
                  _dialogField(
                    controller: codeController,
                    label: 'Warehouse Code',
                    icon: Icons.qr_code_2_outlined,
                  ),
                  const SizedBox(height: 12),
                  _dialogField(
                    controller: locationController,
                    label: 'Location',
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(height: 12),
                  _dialogField(
                    controller: managerController,
                    label: 'Warehouse Manager',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 12),
                  _dialogField(
                    controller: capacityController,
                    label: 'Storage Capacity',
                    icon: Icons.storage_outlined,
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

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Warehouse added successfully.'),
                  ),
                );
              },
              style: _primaryButtonStyle(),
              child: const Text('Add Warehouse'),
            ),
          ],
        );
      },
    );
  }

  Widget _dialogField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 19),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


  void _showWarehouseDetails(Map<String, dynamic> warehouse) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            warehouse['name'].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppTheme.darkNavy,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _detailRow('Warehouse Code', warehouse['code'].toString()),
              _detailRow('Type', warehouse['type'].toString()),
              _detailRow('Location', warehouse['location'].toString()),
              _detailRow('Manager', warehouse['manager'].toString()),
              _detailRow(
                'Capacity',
                '${_formatNumber(warehouse['capacity'] as int)} units',
              ),
              _detailRow(
                'Occupied',
                '${_formatNumber(warehouse['occupied'] as int)} units',
              ),
              _detailRow('SKUs', _formatNumber(warehouse['sku'] as int)),
              _detailRow('Stock Value', _currency(warehouse['stock'])),
              _detailRow('Last Updated', warehouse['updated'].toString()),
              const SizedBox(height: 10),
              _statusBadge(warehouse['status'].toString()),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Edit warehouse will be connected later.'),
                  ),
                );
              },
              style: _primaryButtonStyle(),
              child: const Text('Edit'),
            ),
          ],
        );
      },
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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


  Widget _emptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Icon(Icons.warehouse_outlined, size: 48, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          const Text(
            'No warehouses found',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Try changing your search or status filter.',
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


  String _formatNumber(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(1)},',
    );
  }

  String _currency(dynamic value) {
    final int amount = value is int
        ? value
        : int.tryParse(value.toString()) ?? 0;

    if (amount >= 10000000) {
      return '₹${(amount / 10000000).toStringAsFixed(2)}Cr';
    }

    if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(1)}L';
    }

    if (amount >= 1000) {
      return '₹${(amount / 1000).toStringAsFixed(1)}K';
    }

    return '₹$amount';
  }
}
