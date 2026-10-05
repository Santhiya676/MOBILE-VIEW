import 'package:flutter/material.dart';

class GlobalSettingsPage extends StatefulWidget {
  const GlobalSettingsPage({super.key});

  @override
  State<GlobalSettingsPage> createState() => _GlobalSettingsPageState();
}

class _GlobalSettingsPageState extends State<GlobalSettingsPage> {
  bool maintenanceMode = false;
  bool emailNotifications = true;
  bool auditLogging = true;
  bool twoFactorAuthentication = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FixedHeader(
          title: 'Global Settings',
          subtitle: 'Configure platform-wide settings and preferences.',
          icon: Icons.settings_outlined,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionCard(
                  title: 'Platform Settings',
                  icon: Icons.tune_outlined,
                  children: [
                    _SwitchSetting(
                      title: 'Maintenance Mode',
                      subtitle: 'Temporarily restrict platform access during maintenance.',
                      value: maintenanceMode,
                      onChanged: (value) {
                        setState(() => maintenanceMode = value);
                      },
                    ),
                    _SwitchSetting(
                      title: 'Email Notifications',
                      subtitle: 'Enable platform-wide email notifications.',
                      value: emailNotifications,
                      onChanged: (value) {
                        setState(() => emailNotifications = value);
                      },
                    ),
                    _SwitchSetting(
                      title: 'Audit Logging',
                      subtitle:
                          'Record important platform activities and changes.',
                      value: auditLogging,
                      onChanged: (value) {
                        setState(() => auditLogging = value);
                      },
                    ),
                    _SwitchSetting(
                      title: 'Two-Factor Authentication',
                      subtitle: 'Require additional authentication for supported users.',
                      value: twoFactorAuthentication,
                      onChanged: (value) {
                        setState(() => twoFactorAuthentication = value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _SectionCard(
                  title: 'Regional Settings',
                  icon: Icons.language_outlined,
                  children: const [
                    _InfoRow(label: 'Default Language', value: 'English'),
                    _InfoRow(
                      label: 'Default Time Zone',
                      value: 'IST (UTC+5:30)',
                    ),
                    _InfoRow(label: 'Default Currency', value: 'USD'),
                    _InfoRow(label: 'Date Format', value: 'DD/MM/YYYY'),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('Save Settings'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FixedHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _FixedHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Platform Administration / $title',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _SwitchSetting extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchSetting({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: TextStyle(color: Colors.grey.shade600)),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
