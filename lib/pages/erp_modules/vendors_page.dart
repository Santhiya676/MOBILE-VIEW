import 'package:flutter/material.dart';

import '../../app_theme.dart';

class VendorsPage extends StatefulWidget {
  const VendorsPage({super.key});

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  String searchText = '';

  final List<Map<String, dynamic>> vendors = [
    {
      'name': 'TechSource India Pvt Ltd',
      'code': 'VEN-001',
      'contact': 'Ravi Sharma',
      'phone': '+91 98765 42100',
      'email': 'ravi@techsource.in',
      'category': 'Electronics',
      'location': 'Hyderabad',
      'orders': 24,
      'status': 'Active',
    },
    {
      'name': 'ElectroMart Solutions',
      'code': 'VEN-002',
      'contact': 'Priya Reddy',
      'phone': '+91 98662 31540',
      'email': 'priya@electromart.in',
      'category': 'Computer Accessories',
      'location': 'Bangalore',
      'orders': 18,
      'status': 'Active',
    },
    {
      'name': 'Network World India',
      'code': 'VEN-003',
      'contact': 'Suresh Kumar',
      'phone': '+91 98491 27650',
      'email': 'suresh@networkworld.in',
      'category': 'Networking',
      'location': 'Chennai',
      'orders': 15,
      'status': 'Active',
    },
    {
      'name': 'Office Essentials India',
      'code': 'VEN-004',
      'contact': 'Anita Rao',
      'phone': '+91 98201 54820',
      'email': 'anita@officeessentials.in',
      'category': 'Office Supplies',
      'location': 'Mumbai',
      'orders': 12,
      'status': 'Active',
    },
    {
      'name': 'Prime IT Distributors',
      'code': 'VEN-005',
      'contact': 'Kiran Mehta',
      'phone': '+91 98192 63210',
      'email': 'kiran@primeit.in',
      'category': 'IT Hardware',
      'location': 'Pune',
      'orders': 9,
      'status': 'Active',
    },
    {
      'name': 'Metro Business Supplies',
      'code': 'VEN-006',
      'contact': 'Vikram Singh',
      'phone': '+91 99100 45120',
      'email': 'vikram@metrobs.in',
      'category': 'General Supplies',
      'location': 'Delhi',
      'orders': 6,
      'status': 'Inactive',
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
                      _vendorDirectory(mobile),
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
            'Vendors',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Manage suppliers and vendor relationships.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 16),
          _addVendorButton(),
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
                'Vendors',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.darkNavy,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Manage suppliers and vendor relationships.',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        _addVendorButton(),
      ],
    );
  }

  Widget _addVendorButton() {
    return ElevatedButton.icon(
      onPressed: _showAddVendorDialog,
      icon: const Icon(Icons.person_add_outlined, size: 18),
      label: const Text('Add Vendor'),
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
      _summaryCard('Total Vendors', '6', Icons.people_outline),
      _summaryCard('Active Vendors', '5', Icons.check_circle_outline),
      _summaryCard('Purchase Orders', '84', Icons.receipt_long_outlined),
      _summaryCard('Categories', '6', Icons.category_outlined),
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


  Widget _vendorDirectory(bool mobile) {
    final filteredVendors = vendors.where((vendor) {
      final name = vendor['name'].toString().toLowerCase();
      final code = vendor['code'].toString().toLowerCase();
      final category = vendor['category'].toString().toLowerCase();

      final search = searchText.toLowerCase();

      return name.contains(search) ||
          code.contains(search) ||
          category.contains(search);
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
                  'Vendor Directory',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkNavy,
                  ),
                ),
              ),
              Text(
                '${filteredVendors.length} vendors',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _searchField(),
          const SizedBox(height: 18),
          if (filteredVendors.isEmpty)
            _emptyState()
          else if (mobile)
            _mobileVendorList(filteredVendors)
          else
            _desktopVendorTable(filteredVendors),
        ],
      ),
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
        hintText: 'Search by vendor, code or category...',
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


  Widget _desktopVendorTable(List<Map<String, dynamic>> vendorList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 28,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
        columns: const [
          DataColumn(label: Text('Vendor')),
          DataColumn(label: Text('Contact')),
          DataColumn(label: Text('Category')),
          DataColumn(label: Text('Location')),
          DataColumn(label: Text('Orders')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('')),
        ],
        rows: vendorList.map((vendor) {
          return DataRow(
            cells: [
              DataCell(
                SizedBox(
                  width: 210,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendor['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.darkNavy,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        vendor['code'],
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataCell(
                SizedBox(
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendor['contact'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        vendor['phone'],
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DataCell(Text(vendor['category'])),
              DataCell(Text(vendor['location'])),
              DataCell(
                Text(
                  '${vendor['orders']}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataCell(_statusBadge(vendor['status'])),
              DataCell(
                IconButton(
                  tooltip: 'View vendor',
                  onPressed: () => _showVendorDetails(vendor),
                  icon: const Icon(Icons.visibility_outlined, size: 19),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }


  Widget _mobileVendorList(List<Map<String, dynamic>> vendorList) {
    return Column(
      children: vendorList.map((vendor) {
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
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.lightBlue.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.business_outlined,
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
                          vendor['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.darkNavy,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          vendor['code'],
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _statusBadge(vendor['status']),
                ],
              ),
              const SizedBox(height: 14),
              _mobileInfo(Icons.person_outline, vendor['contact']),
              const SizedBox(height: 6),
              _mobileInfo(Icons.phone_outlined, vendor['phone']),
              const SizedBox(height: 6),
              _mobileInfo(Icons.category_outlined, vendor['category']),
              const SizedBox(height: 6),
              _mobileInfo(Icons.location_on_outlined, vendor['location']),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${vendor['orders']} purchase orders',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showVendorDetails(vendor),
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

  Widget _mobileInfo(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }


  Widget _statusBadge(String status) {
    final active = status == 'Active';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: active ? Colors.green.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: active ? Colors.green.shade700 : Colors.grey.shade600,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


  void _showVendorDetails(Map<String, dynamic> vendor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            vendor['name'],
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
                _detailRow('Vendor Code', vendor['code']),
                _detailRow('Contact', vendor['contact']),
                _detailRow('Phone', vendor['phone']),
                _detailRow('Email', vendor['email']),
                _detailRow('Category', vendor['category']),
                _detailRow('Location', vendor['location']),
                _detailRow('Purchase Orders', '${vendor['orders']}'),
                _detailRow('Status', vendor['status']),
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
            width: 115,
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


  void _showAddVendorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add Vendor',
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
                _dialogField('Vendor Name', 'Enter vendor name'),
                const SizedBox(height: 12),
                _dialogField('Contact Person', 'Enter contact person'),
                const SizedBox(height: 12),
                _dialogField('Phone', 'Enter phone number'),
                const SizedBox(height: 12),
                _dialogField('Email', 'Enter email address'),
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
                      'Vendor form is ready for backend integration.',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Add Vendor'),
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
            'No vendors found',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.darkNavy,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Try changing your search.',
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
