import 'package:flutter/material.dart';

import '../../app_theme.dart';

class SalesOrdersPage extends StatefulWidget {
  const SalesOrdersPage({super.key});

  @override
  State<SalesOrdersPage> createState() => _SalesOrdersPageState();
}

class _SalesOrdersPageState extends State<SalesOrdersPage> {
  String searchText = '';
  String selectedStatus = 'All';

  final List<Map<String, dynamic>> orders = [
    {
      'orderId': 'SO-2026-00871',
      'date': '09 Sep 2026',
      'customer': 'Vertex Technologies Pvt Ltd',
      'items': 3,
      'quantity': 45,
      'amount': 78500.00,
      'warehouse': 'Bangalore DC',
      'status': 'Processing',
      'priority': 'High',
    },
    {
      'orderId': 'SO-2026-00870',
      'date': '09 Sep 2026',
      'customer': 'BlueWave Solutions',
      'items': 2,
      'quantity': 28,
      'amount': 46200.00,
      'warehouse': 'Hyderabad Main',
      'status': 'Pending',
      'priority': 'Normal',
    },
    {
      'orderId': 'SO-2026-00869',
      'date': '08 Sep 2026',
      'customer': 'Apex Business Systems',
      'items': 4,
      'quantity': 62,
      'amount': 114800.00,
      'warehouse': 'Chennai Regional',
      'status': 'Completed',
      'priority': 'Normal',
    },
    {
      'orderId': 'SO-2026-00868',
      'date': '08 Sep 2026',
      'customer': 'Nexus Retail India',
      'items': 3,
      'quantity': 35,
      'amount': 68250.00,
      'warehouse': 'Mumbai Fulfillment',
      'status': 'Processing',
      'priority': 'High',
    },
    {
      'orderId': 'SO-2026-00867',
      'date': '07 Sep 2026',
      'customer': 'GreenLine Industries',
      'items': 2,
      'quantity': 20,
      'amount': 39500.00,
      'warehouse': 'Pune Storage',
      'status': 'Pending',
      'priority': 'Normal',
    },
    {
      'orderId': 'SO-2026-00866',
      'date': '06 Sep 2026',
      'customer': 'Orbit Digital Services',
      'items': 3,
      'quantity': 41,
      'amount': 72900.00,
      'warehouse': 'Bangalore DC',
      'status': 'Completed',
      'priority': 'Normal',
    },
    {
      'orderId': 'SO-2026-00865',
      'date': '05 Sep 2026',
      'customer': 'Prime Office Systems',
      'items': 2,
      'quantity': 30,
      'amount': 51800.00,
      'warehouse': 'Hyderabad Main',
      'status': 'Completed',
      'priority': 'Low',
    },
    {
      'orderId': 'SO-2026-00864',
      'date': '05 Sep 2026',
      'customer': 'Metro IT Solutions',
      'items': 2,
      'quantity': 25,
      'amount': 31800.00,
      'warehouse': 'Chennai Regional',
      'status': 'Processing',
      'priority': 'High',
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
                        _orderManagement(mobile),
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
            'Sales Orders',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Create, manage and track customer orders.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 16),
          _createOrderButton(),
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
                'Sales Orders',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Create, manage and track customer orders.',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        _createOrderButton(),
      ],
    );
  }

  Widget _createOrderButton() {
    return ElevatedButton.icon(
      onPressed: _showCreateOrderDialog,
      icon: const Icon(Icons.add, size: 18),
      label: const Text('Create Order'),
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
      _summaryCard('Total Orders', '8', Icons.receipt_long_outlined),
      _summaryCard('Pending', '2', Icons.pending_outlined),
      _summaryCard('Processing', '3', Icons.autorenew),
      _summaryCard('Completed', '3', Icons.check_circle_outline),
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
      decoration: _decoration(),
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
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _orderManagement(bool mobile) {
    final filteredOrders = orders.where((order) {
      final orderId = order['orderId'].toString().toLowerCase();
      final customer = order['customer'].toString().toLowerCase();

      final search = searchText.toLowerCase();

      final matchesSearch =
          orderId.contains(search) || customer.contains(search);

      final matchesStatus =
          selectedStatus == 'All' || order['status'] == selectedStatus;

      return matchesSearch && matchesStatus;
    }).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _decoration(),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Order Management',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
              ),
              Text(
                '${filteredOrders.length} orders',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
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
    );
  }


  Widget _filters(bool mobile) {
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
        SizedBox(width: 180, child: _statusDropdown()),
      ],
    );
  }

  Widget _searchField() {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchText = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search order ID or customer...',
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
        DropdownMenuItem(value: 'Processing', child: Text('Processing')),
        DropdownMenuItem(value: 'Completed', child: Text('Completed')),
      ],
      onChanged: (value) {
        if (value == null) return;

        setState(() {
          selectedStatus = value;
        });
      },
    );
  }


  Widget _desktopTable(List<Map<String, dynamic>> orderList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 26,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
        columns: const [
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Items')),
          DataColumn(label: Text('Warehouse')),
          DataColumn(label: Text('Amount')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('')),
        ],
        rows: orderList.map((order) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  order['orderId'],
                  style: const TextStyle(
                    color: AppTheme.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DataCell(
                SizedBox(
                  width: 190,
                  child: Text(
                    order['customer'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
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
                  tooltip: 'View order',
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


  Widget _mobileOrders(List<Map<String, dynamic>> orderList) {
    return Column(
      children: orderList.map((order) {
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
                      order['orderId'],
                      style: const TextStyle(
                        color: AppTheme.primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _statusBadge(order['status']),
                ],
              ),
              const SizedBox(height: 11),
              Text(
                order['customer'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 10),
              _mobileInfo(Icons.calendar_today_outlined, order['date']),
              const SizedBox(height: 6),
              _mobileInfo(Icons.warehouse_outlined, order['warehouse']),
              const SizedBox(height: 6),
              _mobileInfo(
                Icons.inventory_2_outlined,
                '${order['items']} items • ${order['quantity']} units',
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
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
        ),
      ],
    );
  }


  Widget _statusBadge(String status) {
    Color background;
    Color foreground;

    switch (status) {
      case 'Completed':
        background = Colors.green.shade50;
        foreground = Colors.green.shade700;
        break;

      case 'Processing':
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
            order['orderId'],
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
                _detailRow('Customer', order['customer']),
                _detailRow('Order Date', order['date']),
                _detailRow('Warehouse', order['warehouse']),
                _detailRow('Items', '${order['items']} items'),
                _detailRow('Quantity', '${order['quantity']} units'),
                _detailRow('Amount', _currency(order['amount'])),
                _detailRow('Priority', order['priority']),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
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


  void _showCreateOrderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Create Sales Order',
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
                _dialogField('Customer', 'Enter customer name'),
                const SizedBox(height: 12),
                _dialogField('Warehouse', 'Select warehouse'),
                const SizedBox(height: 12),
                _dialogField('Product', 'Select product'),
                const SizedBox(height: 12),
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
                      'Sales order form is ready for backend integration.',
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
      padding: const EdgeInsets.symmetric(vertical: 45),
      child: Column(
        children: [
          Icon(
            Icons.search_off_outlined,
            size: 45,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 12),
          const Text(
            'No sales orders found',
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

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
    );
  }
}
