import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_theme.dart';
import '../../providers/user_provider.dart';
import '../../routes/routes.dart';
import '../../widgets/auth_layout.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _orgName = TextEditingController();
  final _orgCode = TextEditingController();
  final _city = TextEditingController();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _accountStep = false;
  bool _loading = false;
  bool _orgCodeEdited = false;
  String _orgType = 'Enterprise';
  String _industry = 'Information Technology';
  String _companySize = '501–1000';
  String _country = 'India';
  String _state = 'Telangana';
  String _timeZone = 'Asia/Kolkata (UTC+05:30)';

  @override
  void dispose() {
    _orgName.dispose();
    _orgCode.dispose();
    _city.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AuthLayout(
        child: Form(
          key: _formKey,
          child: _accountStep ? _accountForm() : _organizationForm(),
        ),
      );

  Widget _organizationForm() => Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        _progress(),
        const SizedBox(height: 13),
        Text('STEP 2 OF 3 · ORGANIZATION DETAILS', style: _eyebrow),
        const SizedBox(height: 6),
        Text('Tell us about your organization', style: GoogleFonts.inter(color: AppTheme.ink, fontSize: 18, height: 1.2, fontWeight: FontWeight.w600, letterSpacing: -.3)),
        const SizedBox(height: 4),
        Text('This helps us set up your workspace on One Enterprise.', style: GoogleFonts.inter(color: AppTheme.muted, fontSize: 9.5)),
        const SizedBox(height: 14),
        _label('Organization Name *'),
        const SizedBox(height: 4),
        TextFormField(
          controller: _orgName,
          style: _inputText,
          decoration: _decoration('ABC Technologies Pvt Ltd'),
          validator: (value) => value == null || value.trim().isEmpty ? 'Enter your organization name' : null,
          onChanged: (value) {
            if (!_orgCodeEdited) {
              _orgCode.text = _slug(value);
            }
          },
        ),
        const SizedBox(height: 8),
        _label('Organization Code *'),
        const SizedBox(height: 4),
        TextFormField(
          controller: _orgCode,
          style: _inputText,
          decoration: _decoration('ABC-TECH'),
          onChanged: (_) => _orgCodeEdited = true,
          validator: (value) => value == null || value.trim().isEmpty ? 'Enter an organization code' : null,
        ),
        const SizedBox(height: 3),
        Text('Auto-generated from your organization name — edit as needed.', style: GoogleFonts.inter(color: AppTheme.muted, fontSize: 7.5)),
        const SizedBox(height: 8),
        _label('Organization Type *'),
        const SizedBox(height: 4),
        _dropdown(_orgType, const ['Enterprise', 'Small Business', 'Startup', 'Non-profit'], (value) => setState(() => _orgType = value!)),
        const SizedBox(height: 8),
        _label('Industry *'),
        const SizedBox(height: 4),
        _dropdown(_industry, const ['Information Technology', 'Finance', 'Healthcare', 'Manufacturing', 'Retail', 'Other'], (value) => setState(() => _industry = value!)),
        const SizedBox(height: 8),
        _label('Company Size *'),
        const SizedBox(height: 4),
        _dropdown(_companySize, const ['1–50', '51–200', '201–500', '501–1000', '1000+'], (value) => setState(() => _companySize = value!)),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_label('Country *'), const SizedBox(height: 4), _dropdown(_country, const ['India', 'United States', 'United Kingdom', 'Singapore'], (value) => setState(() => _country = value!))])),
          const SizedBox(width: 9),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_label('State / Province *'), const SizedBox(height: 4), _dropdown(_state, const ['Telangana', 'Karnataka', 'Tamil Nadu', 'Maharashtra', 'Other'], (value) => setState(() => _state = value!))])),
        ]),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_label('City *'), const SizedBox(height: 4), TextFormField(controller: _city, style: _inputText, decoration: _decoration('Hyderabad'), validator: (value) => value == null || value.trim().isEmpty ? 'Enter a city' : null)])),
          const SizedBox(width: 9),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_label('Time Zone *'), const SizedBox(height: 4), _dropdown(_timeZone, const ['Asia/Kolkata (UTC+05:30)', 'UTC', 'America/New_York', 'Europe/London'], (value) => setState(() => _timeZone = value!))])),
        ]),
        const SizedBox(height: 13),
        SizedBox(width: double.infinity, height: 38, child: ElevatedButton(onPressed: _continueToAccount, child: const Text('Continue', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)))),
        const SizedBox(height: 7),
        Center(child: TextButton(onPressed: () => context.go(AppRoutes.login), style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Back to sign in', style: TextStyle(color: AppTheme.muted, fontSize: 9)))),
      ]);

  Widget _accountForm() => Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        _progress(),
        const SizedBox(height: 13),
        Text('STEP 3 OF 3 · ACCOUNT DETAILS', style: _eyebrow),
        const SizedBox(height: 6),
        Text('Create your admin account', style: GoogleFonts.inter(color: AppTheme.ink, fontSize: 18, height: 1.2, fontWeight: FontWeight.w600, letterSpacing: -.3)),
        const SizedBox(height: 4),
        Text('This account will manage ${_orgName.text.trim().isEmpty ? 'your organization' : _orgName.text.trim()}.', style: GoogleFonts.inter(color: AppTheme.muted, fontSize: 9.5), maxLines: 2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 16),
        _label('Your Name *'),
        const SizedBox(height: 4),
        TextFormField(controller: _name, style: _inputText, decoration: _decoration('Renu Kapoor'), validator: (value) => value == null || value.trim().length < 2 ? 'Enter your name' : null),
        const SizedBox(height: 11),
        _label('Work Email *'),
        const SizedBox(height: 4),
        TextFormField(controller: _email, keyboardType: TextInputType.emailAddress, style: _inputText, decoration: _decoration('you@company.com'), validator: (value) => value == null || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim()) ? 'Enter a valid work email' : null),
        const SizedBox(height: 11),
        _label('Password *'),
        const SizedBox(height: 4),
        TextFormField(controller: _password, obscureText: true, style: _inputText, decoration: _decoration('Create a password'), validator: (value) => value == null || value.length < 6 ? 'Use at least 6 characters' : null),
        const SizedBox(height: 11),
        _label('Confirm Password *'),
        const SizedBox(height: 4),
        TextFormField(controller: _confirmPassword, obscureText: true, style: _inputText, decoration: _decoration('Confirm your password'), validator: (value) => value != _password.text ? 'Passwords do not match' : null),
        const SizedBox(height: 15),
        SizedBox(width: double.infinity, height: 38, child: ElevatedButton(onPressed: _loading ? null : _createAccount, child: Text(_loading ? 'Creating workspace...' : 'Create workspace', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)))),
        const SizedBox(height: 7),
        Center(child: TextButton(onPressed: () => setState(() => _accountStep = false), style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap), child: const Text('Back to organization details', style: TextStyle(color: AppTheme.muted, fontSize: 9)))),
      ]);

  Widget _progress() => Row(children: List.generate(3, (index) => Expanded(child: Container(height: 2, margin: EdgeInsets.only(right: index < 2 ? 4 : 0), color: index < (_accountStep ? 3 : 2) ? AppTheme.darkNavy : const Color(0xFFE5E8EE)))));

  static const _eyebrow = TextStyle(fontSize: 8, color: AppTheme.muted, letterSpacing: .9, fontFamily: 'monospace');
  static const _inputText = TextStyle(fontSize: 10.5, color: AppTheme.ink);

  Widget _label(String value) => Text(value, style: const TextStyle(color: AppTheme.ink, fontSize: 8.5, fontWeight: FontWeight.w600));

  InputDecoration _decoration(String hint) => InputDecoration(hintText: hint, hintStyle: const TextStyle(color: Color(0xFFA0A9B6), fontSize: 9.5), isDense: true, contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10));

  Widget _dropdown(String value, List<String> choices, ValueChanged<String?> onChanged) => DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down, size: 15),
        style: _inputText,
        decoration: _decoration('Select'),
        items: choices.map((choice) => DropdownMenuItem(value: choice, child: Text(choice, maxLines: 1, overflow: TextOverflow.ellipsis, style: _inputText))).toList(),
        onChanged: onChanged,
      );

  String _slug(String value) => value.trim().toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]+'), '-').replaceAll(RegExp(r'^-+|-+$'), '');

  void _continueToAccount() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) setState(() => _accountStep = true);
  }

  void _createAccount() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _loading = true);
    ref.read(userProvider.notifier).register(_name.text.trim(), _email.text.trim(), _password.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Workspace account created. You can now sign in.')));
    context.go(AppRoutes.login);
  }
}
