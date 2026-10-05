import 'package:flutter/material.dart';

import '../../app_theme.dart';

class DispatchPage extends StatefulWidget {
  const DispatchPage({super.key});

  @override
  State<DispatchPage> createState() => _DispatchPageState();
}

class _DispatchPageState extends State<DispatchPage> {
  String searchText = '';
  String selectedStatus = 'All';

  final List<Map<String, dynamic>> dispatches = [
    {
      'dispatchId': 'DSP-2026-00341',
      'orderId': 'SO-2026-00871',
      'date': '09 Sep 2026',
      'customer': 'Vertex Technologies Pvt Ltd',
      'warehouse': 'Bangalore DC',
      'carrier': 'BlueDart',
      'tracking': 'BD784521963IN',
      'packages': 3,
      'status': 'Ready',
      'destination': 'Hyderabad',
    },
    {
      'dispatchId': 'DSP-2026-00340',
      'orderId': 'SO-2026-00864',
      'date': '08 Sep 2026',
      'customer': 'Metro IT Solutions',
      'warehouse': 'Chennai Regional',
      'carrier': 'Delhivery',
      'tracking': 'DL568214790IN',
      'packages': 2,
      'status': 'In Transit',
      'destination': 'Bangalore',
    },
    {
      'dispatchId': 'DSP-2026-00339',
      'orderId': 'SO-2026-00869',
      'date': '08 Sep 2026',
      'customer': 'Apex Business Systems',
      'warehouse': 'Chennai Regional',
      'carrier': 'DTDC',
      'tracking': 'DT453219876IN',
      'packages': 4,
      'status': 'Delivered',
      'destination': 'Chennai',
    },
    {
      'dispatchId': 'DSP-2026-00338',
      'orderId': 'SO-2026-00868',
      'date': '07 Sep 2026',
      'customer': 'Nexus Retail India',
      'warehouse': 'Mumbai Fulfillment',
      'carrier': 'BlueDart',
      'tracking': 'BD963214785IN',
      'packages': 3,
      'status': 'In Transit',
      'destination': 'Pune',
    },
    {
      'dispatchId': 'DSP-2026-00337',
      'orderId': 'SO-2026-00866',
      'date': '06 Sep 2026',
      'customer': 'Orbit Digital Services',
      'warehouse': 'Bangalore DC',
      'carrier': 'Delhivery',
      'tracking': 'DL214785963IN',
      'packages': 3,
      'status': 'Delivered',
      'destination': 'Hyderabad',
    },
    {
      'dispatchId': 'DSP-2026-00336',
      'orderId': 'SO-2026-00865',
      'date': '05 Sep 2026',
      'customer': 'Prime Office Systems',
      'warehouse': 'Hyderabad Main',
      'carrier': 'DTDC',
      'tracking': 'DT785214369IN',
      'packages': 2,
      'status': 'Delayed',
      'destination': 'Mumbai',
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
                        _dispatchQueue(mobile),
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
            'Dispatch',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Manage shipments, deliveries and dispatch operations.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 16),
          _newDispatchButton(),
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
                'Dispatch',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Manage shipments, deliveries and dispatch operations.',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        _newDispatchButton(),
      ],
    );
  }

  Widget _newDispatchButton() {
    return ElevatedButton.icon(
      onPressed: _showNewDispatchDialog,
      icon: const Icon(Icons.local_shipping_outlined, size: 18),
      label: const Text('New Dispatch'),
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
      _summaryCard('Ready', '1', Icons.inventory_outlined),
      _summaryCard('In Transit', '2', Icons.local_shipping_outlined),
      _summaryCard('Delivered', '2', Icons.check_circle_outline),
      _summaryCard('Delayed', '1', Icons.warning_amber_outlined),
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


  Widget _dispatchQueue(bool mobile) {
    final filteredDispatches = dispatches.where((dispatch) {
      final dispatchId = dispatch['dispatchId'].toString().toLowerCase();
      final orderId = dispatch['orderId'].toString().toLowerCase();
      final customer = dispatch['customer'].toString().toLowerCase();

      final search = searchText.toLowerCase();

      final matchesSearch =
          dispatchId.contains(search) ||
          orderId.contains(search) ||
          customer.contains(search);

      final matchesStatus =
          selectedStatus == 'All' || dispatch['status'] == selectedStatus;

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
                  'Dispatch Queue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
              ),
              Text(
                '${filteredDispatches.length} shipments',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _filters(mobile),
          const SizedBox(height: 18),
          if (filteredDispatches.isEmpty)
            _emptyState()
          else if (mobile)
            _mobileDispatches(filteredDispatches)
          else
            _desktopTable(filteredDispatches),
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
        hintText: 'Search dispatch, order or customer...',
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
        DropdownMenuItem(value: 'Ready', child: Text('Ready')),
        DropdownMenuItem(value: 'In Transit', child: Text('In Transit')),
        DropdownMenuItem(value: 'Delivered', child: Text('Delivered')),
        DropdownMenuItem(value: 'Delayed', child: Text('Delayed')),
      ],
      onChanged: (value) {
        if (value == null) return;

        setState(() {
          selectedStatus = value;
        });
      },
    );
  }


  Widget _desktopTable(List<Map<String, dynamic>> dispatchList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 25,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
        columns: const [
          DataColumn(label: Text('Dispatch ID')),
          DataColumn(label: Text('Sales Order')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Warehouse')),
          DataColumn(label: Text('Carrier')),
          DataColumn(label: Text('Packages')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('')),
        ],
        rows: dispatchList.map((dispatch) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  dispatch['dispatchId'],
                  style: const TextStyle(
                    color: AppTheme.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DataCell(
                Text(
                  dispatch['orderId'],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              DataCell(SizedBox(width: 180, child: Text(dispatch['customer']))),
              DataCell(Text(dispatch['warehouse'])),
              DataCell(Text(dispatch['carrier'])),
              DataCell(Text('${dispatch['packages']}')),
              DataCell(_statusBadge(dispatch['status'])),
              DataCell(
                IconButton(
                  tooltip: 'View dispatch',
                  onPressed: () => _showDispatchDetails(dispatch),
                  icon: const Icon(Icons.visibility_outlined, size: 19),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }


  Widget _mobileDispatches(List<Map<String, dynamic>> dispatchList) {
    return Column(
      children: dispatchList.map((dispatch) {
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
                      dispatch['dispatchId'],
                      style: const TextStyle(
                        color: AppTheme.primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _statusBadge(dispatch['status']),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                dispatch['orderId'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkNavy,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                dispatch['customer'],
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
              ),
              const SizedBox(height: 12),
              _mobileInfo(Icons.warehouse_outlined, dispatch['warehouse']),
              const SizedBox(height: 6),
              _mobileInfo(Icons.local_shipping_outlined, dispatch['carrier']),
              const SizedBox(height: 6),
              _mobileInfo(Icons.location_on_outlined, dispatch['destination']),
              const SizedBox(height: 6),
              _mobileInfo(
                Icons.inventory_2_outlined,
                '${dispatch['packages']} packages',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dispatch['tracking'],
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showDispatchDetails(dispatch),
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
      case 'Ready':
        background = Colors.orange.shade50;
        foreground = Colors.orange.shade700;
        break;

      case 'In Transit':
        background = Colors.blue.shade50;
        foreground = Colors.blue.shade700;
        break;

      case 'Delivered':
        background = Colors.green.shade50;
        foreground = Colors.green.shade700;
        break;

      case 'Delayed':
        background = Colors.red.shade50;
        foreground = Colors.red.shade700;
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


  void _showDispatchDetails(Map<String, dynamic> dispatch) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            dispatch['dispatchId'],
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
                _detailRow('Sales Order', dispatch['orderId']),
                _detailRow('Customer', dispatch['customer']),
                _detailRow('Date', dispatch['date']),
                _detailRow('Warehouse', dispatch['warehouse']),
                _detailRow('Carrier', dispatch['carrier']),
                _detailRow('Tracking', dispatch['tracking']),
                _detailRow('Packages', '${dispatch['packages']}'),
                _detailRow('Destination', dispatch['destination']),
                _detailRow('Status', dispatch['status']),
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


  void _showNewDispatchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'New Dispatch',
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
                _dialogField('Sales Order', 'Select sales order'),
                const SizedBox(height: 12),
                _dialogField('Warehouse', 'Select warehouse'),
                const SizedBox(height: 12),
                _dialogField('Carrier', 'Enter carrier'),
                const SizedBox(height: 12),
                _dialogField('Destination', 'Enter destination'),
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
                      'Dispatch form is ready for backend integration.',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Create Dispatch'),
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
            'No dispatch records found',
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


  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
    );
  }
}
