import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ProcurementPage extends StatefulWidget {
  const ProcurementPage({super.key});

  @override
  State<ProcurementPage> createState() => _ProcurementPageState();
}

class _ProcurementPageState extends State<ProcurementPage> {
  String searchText = '';
  String selectedStatus = 'All';

  final List<Map<String, dynamic>> purchaseOrders = [
    {
      'po': 'PO-2026-00418',
      'date': '09 Sep 2026',
      'vendor': 'TechSource India Pvt Ltd',
      'items': 3,
      'amount': 184500.00,
      'status': 'Received',
      'warehouse': 'Hyderabad Main',
      'expected': '09 Sep 2026',
    },
    {
      'po': 'PO-2026-00417',
      'date': '08 Sep 2026',
      'vendor': 'ElectroMart Solutions',
      'items': 4,
      'amount': 126800.00,
      'status': 'Approved',
      'warehouse': 'Bangalore DC',
      'expected': '12 Sep 2026',
    },
    {
      'po': 'PO-2026-00416',
      'date': '07 Sep 2026',
      'vendor': 'Network World India',
      'items': 2,
      'amount': 98500.00,
      'status': 'Pending',
      'warehouse': 'Chennai Regional',
      'expected': '14 Sep 2026',
    },
    {
      'po': 'PO-2026-00415',
      'date': '05 Sep 2026',
      'vendor': 'Office Essentials India',
      'items': 5,
      'amount': 76300.00,
      'status': 'Approved',
      'warehouse': 'Hyderabad Main',
      'expected': '13 Sep 2026',
    },
    {
      'po': 'PO-2026-00414',
      'date': '03 Sep 2026',
      'vendor': 'TechSource India Pvt Ltd',
      'items': 2,
      'amount': 54200.00,
      'status': 'Received',
      'warehouse': 'Mumbai Fulfillment',
      'expected': '08 Sep 2026',
    },
    {
      'po': 'PO-2026-00413',
      'date': '01 Sep 2026',
      'vendor': 'ElectroMart Solutions',
      'items': 3,
      'amount': 91750.00,
      'status': 'Pending',
      'warehouse': 'Pune Storage',
      'expected': '16 Sep 2026',
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
          final double topPadding = mobile ? 16 : 28;

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
                  child: _pageHeader(mobile),
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
                        _summaryCards(mobile),
                        const SizedBox(height: 24),
                        _purchaseOrders(mobile),
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


  Widget _pageHeader(bool mobile) {
    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Procurement',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Manage purchase orders and supplier purchases.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 16),
          _newOrderButton(),
        ],
      );
    }

    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Procurement',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Manage purchase orders and supplier purchases.',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        _newOrderButton(),
      ],
    );
  }

  Widget _newOrderButton() {
    return ElevatedButton.icon(
      onPressed: _showNewOrderDialog,
      icon: const Icon(Icons.add, size: 18),
      label: const Text('New Purchase Order'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


  Widget _summaryCards(bool mobile) {
    final cards = [
      _summaryCard('Purchase Orders', '6', Icons.receipt_long_outlined),
      _summaryCard('Pending', '2', Icons.pending_actions_outlined),
      _summaryCard('Approved', '2', Icons.check_circle_outline),
      _summaryCard('Received', '2', Icons.inventory_2_outlined),
    ];

    return GridView.count(
      crossAxisCount: mobile ? 2 : 4,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: mobile ? 1.55 : 2.25,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: cards,
    );
  }

  Widget _summaryCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: AppTheme.lightBlue.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.primaryBlue, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppTheme.darkNavy,
                    fontSize: 22,
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


  Widget _purchaseOrders(bool mobile) {
    final filteredOrders = purchaseOrders.where((order) {
      final po = order['po'].toString().toLowerCase();
      final vendor = order['vendor'].toString().toLowerCase();

      final matchesSearch =
          po.contains(searchText.toLowerCase()) ||
          vendor.contains(searchText.toLowerCase());

      final matchesStatus =
          selectedStatus == 'All' || order['status'] == selectedStatus;

      return matchesSearch && matchesStatus;
    }).toList();

    return Container(
      width: double.infinity,
      decoration: _cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ordersHeader(mobile),
            const SizedBox(height: 18),
            _filters(mobile),
            const SizedBox(height: 18),
            if (filteredOrders.isEmpty)
              _emptyState()
            else if (mobile)
              _mobileOrders(filteredOrders)
            else
              _desktopTable(filteredOrders),
          ],
        ),
      ),
    );
  }

  Widget _ordersHeader(bool mobile) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Purchase Orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
        ),
        if (!mobile)
          Text(
            '${purchaseOrders.length} orders',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
      ],
    );
  }


  Widget _filters(bool mobile) {
    if (mobile) {
      return Column(
        children: [_searchBox(), const SizedBox(height: 10), _statusDropdown()],
      );
    }

    return Row(
      children: [
        Expanded(flex: 2, child: _searchBox()),
        const SizedBox(width: 12),
        SizedBox(width: 180, child: _statusDropdown()),
      ],
    );
  }

  Widget _searchBox() {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchText = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search PO or vendor...',
        prefixIcon: const Icon(Icons.search, size: 20),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
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
          horizontal: 14,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      items: const [
        DropdownMenuItem(value: 'All', child: Text('All Status')),
        DropdownMenuItem(value: 'Pending', child: Text('Pending')),
        DropdownMenuItem(value: 'Approved', child: Text('Approved')),
        DropdownMenuItem(value: 'Received', child: Text('Received')),
      ],
      onChanged: (value) {
        if (value == null) return;

        setState(() {
          selectedStatus = value;
        });
      },
    );
  }


  Widget _desktopTable(List<Map<String, dynamic>> orders) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 28,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
        columns: const [
          DataColumn(label: Text('PO Number')),
          DataColumn(label: Text('Vendor')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Items')),
          DataColumn(label: Text('Warehouse')),
          DataColumn(label: Text('Amount')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('')),
        ],
        rows: orders.map((order) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  order['po'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlue,
                  ),
                ),
              ),
              DataCell(
                Text(
                  order['vendor'],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              DataCell(Text(order['date'])),
              DataCell(Text('${order['items']} items')),
              DataCell(Text(order['warehouse'])),
              DataCell(
                Text(
                  _currency(order['amount']),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataCell(_statusBadge(order['status'])),
              DataCell(
                IconButton(
                  tooltip: 'View details',
                  onPressed: () => _showOrderDetails(order),
                  icon: const Icon(Icons.visibility_outlined, size: 19),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }


  Widget _mobileOrders(List<Map<String, dynamic>> orders) {
    return Column(
      children: orders.map((order) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      order['po'],
                      style: const TextStyle(
                        color: AppTheme.primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _statusBadge(order['status']),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                order['vendor'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 8),
              _mobileInfo(Icons.calendar_today_outlined, order['date']),
              const SizedBox(height: 5),
              _mobileInfo(Icons.warehouse_outlined, order['warehouse']),
              const SizedBox(height: 5),
              _mobileInfo(
                Icons.inventory_2_outlined,
                '${order['items']} items',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _currency(order['amount']),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showOrderDetails(order),
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _mobileInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.grey.shade500),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }


  Widget _statusBadge(String status) {
    Color background;
    Color foreground;

    switch (status) {
      case 'Received':
        background = Colors.green.shade50;
        foreground = Colors.green.shade700;
        break;

      case 'Approved':
        background = Colors.blue.shade50;
        foreground = Colors.blue.shade700;
        break;

      case 'Pending':
        background = Colors.orange.shade50;
        foreground = Colors.orange.shade700;
        break;

      default:
        background = Colors.grey.shade100;
        foreground = Colors.grey.shade700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: foreground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


  void _showOrderDetails(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            order['po'],
            style: const TextStyle(
              color: AppTheme.darkNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SizedBox(
            width: 430,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _detailRow('Vendor', order['vendor']),
                _detailRow('Order Date', order['date']),
                _detailRow('Expected', order['expected']),
                _detailRow('Warehouse', order['warehouse']),
                _detailRow('Items', '${order['items']} items'),
                _detailRow('Amount', _currency(order['amount'])),
                _detailRow('Status', order['status']),
              ],
            ),
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
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppTheme.darkNavy,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showNewOrderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'New Purchase Order',
            style: TextStyle(
              color: AppTheme.darkNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: SizedBox(
            width: 430,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogField('Vendor', 'Select vendor'),
                const SizedBox(height: 14),
                _dialogField('Warehouse', 'Select warehouse'),
                const SizedBox(height: 14),
                _dialogField('Product', 'Select product'),
                const SizedBox(height: 14),
                _dialogField('Quantity', 'Enter quantity'),
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

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Purchase order form is ready for backend integration.',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Create Order'),
            ),
          ],
        );
      },
    );
  }

  Widget _dialogField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
      ),
    );
  }


  Widget _emptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Icon(
            Icons.search_off_outlined,
            size: 45,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 12),
          const Text(
            'No purchase orders found',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Try changing your search or status filter.',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          ),
        ],
      ),
    );
  }


  String _currency(double amount) {
    return '₹${amount.toStringAsFixed(2)}';
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
    );
  }
}
