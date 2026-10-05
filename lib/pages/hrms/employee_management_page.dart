import 'package:flutter/material.dart';

class EmployeeManagementPage extends StatefulWidget {
  const EmployeeManagementPage({super.key});

  @override
  State<EmployeeManagementPage> createState() => _EmployeeManagementPageState();
}

class _EmployeeManagementPageState extends State<EmployeeManagementPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> employees = [
    {
      'id': 'EMP001',
      'name': 'Rahul Sharma',
      'department': 'IT',
      'designation': 'Software Engineer',
      'status': 'Active',
    },
    {
      'id': 'EMP002',
      'name': 'Priya Reddy',
      'department': 'HR',
      'designation': 'HR Manager',
      'status': 'Active',
    },
    {
      'id': 'EMP003',
      'name': 'Arjun Kumar',
      'department': 'Finance',
      'designation': 'Accountant',
      'status': 'Active',
    },
    {
      'id': 'EMP004',
      'name': 'Sneha Rao',
      'department': 'Sales',
      'designation': 'Sales Executive',
      'status': 'On Leave',
    },
    {
      'id': 'EMP005',
      'name': 'Vikram Singh',
      'department': 'Operations',
      'designation': 'Operations Manager',
      'status': 'Active',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.badge_outlined,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Employee Management',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Manage employees, departments and workforce information.',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = 4;

                    if (constraints.maxWidth < 1000) {
                      columns = 2;
                    }

                    if (constraints.maxWidth < 600) {
                      columns = 1;
                    }

                    final width =
                        (constraints.maxWidth - ((columns - 1) * 16)) / columns;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _KpiCard(
                          width: width,
                          title: 'Total Employees',
                          value: '248',
                          icon: Icons.people_alt_outlined,
                        ),
                        _KpiCard(
                          width: width,
                          title: 'Active Employees',
                          value: '231',
                          icon: Icons.person_outline,
                        ),
                        _KpiCard(
                          width: width,
                          title: 'On Leave',
                          value: '12',
                          icon: Icons.event_busy_outlined,
                        ),
                        _KpiCard(
                          width: width,
                          title: 'New Employees',
                          value: '5',
                          icon: Icons.person_add_alt_outlined,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Employees',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _showAddEmployeeDialog(context);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Employee'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search employees...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 35,
                      headingRowColor: WidgetStateProperty.all(
                        Colors.grey.shade50,
                      ),
                      columns: const [
                        DataColumn(label: Text('Employee ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Department')),
                        DataColumn(label: Text('Designation')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: employees.map((employee) {
                        return DataRow(
                          cells: [
                            DataCell(Text(employee['id']!)),
                            DataCell(Text(employee['name']!)),
                            DataCell(Text(employee['department']!)),
                            DataCell(Text(employee['designation']!)),
                            DataCell(_StatusBadge(status: employee['status']!)),
                            DataCell(
                              IconButton(
                                tooltip: 'View Employee',
                                onPressed: () {
                                  _showEmployeeDetails(context, employee);
                                },
                                icon: const Icon(Icons.visibility_outlined),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAddEmployeeDialog(BuildContext context) {
    final nameController = TextEditingController();
    final departmentController = TextEditingController();
    final designationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Employee'),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Employee Name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: departmentController,
                  decoration: const InputDecoration(labelText: 'Department'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: designationController,
                  decoration: const InputDecoration(labelText: 'Designation'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Employee added successfully.')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showEmployeeDetails(
    BuildContext context,
    Map<String, String> employee,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(employee['name']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Employee ID: ${employee['id']}'),
              const SizedBox(height: 8),
              Text('Department: ${employee['department']}'),
              const SizedBox(height: 8),
              Text('Designation: ${employee['designation']}'),
              const SizedBox(height: 8),
              Text('Status: ${employee['status']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}


class _KpiCard extends StatelessWidget {
  final double width;
  final String title;
  final String value;
  final IconData icon;

  const _KpiCard({
    required this.width,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 105,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final bool active = status == 'Active';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: active
            ? Colors.green.withValues(alpha: 0.10)
            : Colors.orange.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: active ? Colors.green : Colors.orange,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
