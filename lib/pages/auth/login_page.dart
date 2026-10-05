import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as flutter_provider;

import '../../app_theme.dart';
import '../../providers/auth_flow_provider.dart';
import '../../providers/user_provider.dart';
import '../../routes/routes.dart';
import '../../widgets/auth_layout.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final workspaceController = TextEditingController(text: 'acmecorp');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();
  bool hidePassword = true;
  bool rememberMe = true;

  @override
  void dispose() {
    workspaceController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void _requestOtp(AuthFlowProvider flow) {
    final email = emailController.text.trim();
    final password = passwordController.text;
    const testEmail = 'user@gmail.com';
    const testPassword = '123456';
    final registered = ref.read(userProvider.notifier).validateLogin(email, password);
    flow.requestOtp(
      email: email,
      password: password,
      credentialsValid: (email == testEmail && password == testPassword) || registered,
    );
  }

  void _verifyOtp(AuthFlowProvider flow) {
    if (flow.verifyOtp(otpController.text)) {
      ref.read(userProvider.notifier).login(emailController.text.trim());
      context.go(AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    final flow = flutter_provider.Provider.of<AuthFlowProvider>(context);
    return AuthLayout(
      child: Builder(builder: (context) {
        final appearance = AuthVisualSettings.of(context);
        final dark = appearance?.darkMode ?? false;
        final tamil = appearance?.language == 'TA';
        String tr(String english, String tamilText) => tamil ? tamilText : english;
        final border = OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: dark ? const Color(0xFF344462) : AppTheme.border));
        return Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: dark ? const Color(0xFF17233D) : Colors.white,
              hintStyle: TextStyle(
                color: dark ? const Color(0xFF9DABC3) : const Color(0xFFA0A9B6),
                fontSize: 13,
              ),
              border: border,
              enabledBorder: border,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Color(0xFF278BFF),
                  width: 1.2,
                ),
              ),
            ),
          ),
          child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(flow.otpRequested ? tr('STEP 2 OF 3 · VERIFY', 'படி 2 / 3 · சரிபார்ப்பு') : tr('STEP 1 OF 3 · IDENTIFY', 'படி 1 / 3 · அடையாளம்'), style: TextStyle(fontSize: 9, color: dark ? const Color(0xFFAFBED5) : AppTheme.muted, letterSpacing: 1.1, fontFamily: 'monospace')),
            if (flow.otpRequested) ...[
              const SizedBox(height: 7),
            ],
            const SizedBox(height: 7),
            Text(tr('Sign in', 'உள்நுழை'), style: GoogleFonts.inter(fontSize: 22, height: 1.2, fontWeight: FontWeight.w700, color: dark ? Colors.white : const Color(0xFF102956), letterSpacing: -.5)),
            const SizedBox(height: 5),
            Text(tr('Enter your workspace and work email to continue.', 'உங்கள் பணியிடத்தையும் பணி மின்னஞ்சலையும் உள்ளிட்டு தொடரவும்.'),
                style: GoogleFonts.inter(color: dark ? const Color(0xFFB7C5DA) : const Color(0xFF667C9F), fontSize: 11.5, height: 1.45)),
            const SizedBox(height: 20),
            _label(tr('Workspace', 'பணியிடம்'), dark: dark),
            const SizedBox(height: 5),
            Row(children: [
              Expanded(
                child: TextField(
                  controller: workspaceController,
                  decoration: const InputDecoration(isDense: true, hintText: 'acmecorp', contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 11)),
                  style: TextStyle(fontSize: 12, color: dark ? Colors.white : AppTheme.ink),
                  enabled: !flow.otpRequested,
                ),
              ),
              Container(
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: dark ? const Color(0xFF202D47) : const Color(0xFFF3F4F6), border: Border.all(color: dark ? const Color(0xFF344462) : AppTheme.border), borderRadius: const BorderRadius.horizontal(right: Radius.circular(7))),
                child: Text('.oneenterprise.io', style: TextStyle(color: dark ? const Color(0xFFB7C5DA) : const Color(0xFF667C9F), fontSize: 9, fontFamily: 'monospace')),
              ),
            ]),
            const SizedBox(height: 4),
            RichText(text: TextSpan(style: GoogleFonts.inter(color: dark ? const Color(0xFFB7C5DA) : AppTheme.muted, fontSize: 9), children: [
              TextSpan(text: tr("Don't know your workspace? ", 'பணியிடம் தெரியவில்லையா? ')),
              TextSpan(text: tr('Find it here', 'இங்கே தேடவும்'), style: TextStyle(color: dark ? const Color(0xFF62A9FF) : AppTheme.darkNavy, fontWeight: FontWeight.w600)),
            ])),
            const SizedBox(height: 16),
            _label(tr('Work email', 'பணி மின்னஞ்சல்'), dark: dark),
            const SizedBox(height: 5),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.username, AutofillHints.email],
              enabled: !flow.otpRequested,
              decoration: const InputDecoration(isDense: true, hintText: 'you@acmecorp.com'),
              style: TextStyle(fontSize: 12, color: dark ? Colors.white : AppTheme.ink),
            ),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _label(tr('Password', 'கடவுச்சொல்'), dark: dark),
              if (!flow.otpRequested)
                GestureDetector(onTap: () => context.push(AppRoutes.forgotPassword), child: Text(tr('Forgot password?', 'கடவுச்சொல் மறந்துவிட்டதா?'), style: const TextStyle(color: Color(0xFF0877F9), fontSize: 10, fontWeight: FontWeight.w600))),
            ]),
            const SizedBox(height: 5),
            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              autofillHints: const [AutofillHints.password],
              enabled: !flow.otpRequested,
              onSubmitted: (_) => flow.otpRequested ? _verifyOtp(flow) : _requestOtp(flow),
              decoration: InputDecoration(
                isDense: true,
                hintText: tr('Enter your password', 'கடவுச்சொல்லை உள்ளிடவும்'),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => hidePassword = !hidePassword),
                  icon: Icon(hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 17, color: dark ? const Color(0xFFB7C5DA) : AppTheme.muted),
                ),
              ),
              style: TextStyle(fontSize: 12, color: dark ? Colors.white : AppTheme.ink),
            ),
            if (flow.otpRequested) ...[
              const SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                _label(tr('Verification code', 'சரிபார்ப்பு குறியீடு'), dark: dark),
                TextButton(
                  onPressed: () { flow.backToCredentials(); otpController.clear(); },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(tr('Change credentials', 'விவரங்களை மாற்று'), style: TextStyle(fontSize: 9, color: dark ? const Color(0xFF78B8FF) : AppTheme.darkNavy)),
                ),
              ]),
              const SizedBox(height: 5),
              TextField(
                controller: otpController,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onSubmitted: (_) => _verifyOtp(flow),
                decoration: InputDecoration(isDense: true, hintText: tr('Enter 6-digit code', '6 இலக்க குறியீட்டை உள்ளிடவும்'), counterText: '', prefixIcon: const Icon(Icons.dialpad_outlined, size: 17)),
                style: TextStyle(fontSize: 13, letterSpacing: 3, color: dark ? Colors.white : AppTheme.ink),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: dark ? const Color(0xFF1C2A45) : const Color(0xFFF4F5F8), borderRadius: BorderRadius.circular(6)),
                child: Text('${tr('Demo code', 'சோதனை குறியீடு')}: ${flow.verificationCode}  ·  ${tr('Email delivery is not configured', 'மின்னஞ்சல் அனுப்புதல் அமைக்கப்படவில்லை')}',
                    style: TextStyle(fontSize: 9, color: dark ? const Color(0xFFB7C5DA) : AppTheme.muted)),
              ),
            ],
            if (!flow.otpRequested) ...[
              const SizedBox(height: 5),
              Row(children: [
                SizedBox(width: 22, height: 22, child: Checkbox(value: rememberMe, activeColor: const Color(0xFF0877F9), onChanged: (value) => setState(() => rememberMe = value ?? false), visualDensity: VisualDensity.compact)),
                const SizedBox(width: 5),
                Text(tr('Remember me', 'என்னை நினைவில் வைக்கவும்'), style: GoogleFonts.inter(color: dark ? Colors.white : const Color(0xFF142858), fontSize: 10, fontWeight: FontWeight.w500)),
              ]),
            ],
            if (flow.errorMessage.isNotEmpty) ...[
              const SizedBox(height: 9),
              Text(flow.errorMessage, style: const TextStyle(color: Color(0xFFB54747), fontSize: 10)),
            ],
            const SizedBox(height: 11),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => flow.otpRequested ? _verifyOtp(flow) : _requestOtp(flow),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF082A72), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                child: Text(flow.otpRequested ? tr('Verify and sign in', 'சரிபார்த்து உள்நுழை') : tr('Continue', 'தொடரவும்'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ),
            if (!flow.otpRequested) ...[
              const SizedBox(height: 14),
              Row(children: [
                Expanded(child: Divider(color: dark ? const Color(0xFF344462) : const Color(0xFFE8EAF0))),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text(tr('or continue with', 'அல்லது இதன் மூலம் தொடரவும்'), style: GoogleFonts.inter(color: dark ? const Color(0xFFB7C5DA) : AppTheme.muted, fontSize: 9))),
                Expanded(child: Divider(color: dark ? const Color(0xFF344462) : const Color(0xFFE8EAF0))),
              ]),
              const SizedBox(height: 10),
              _ssoButton(tr('Continue with Google', 'Google மூலம் தொடரவும்'), const Text('G', style: TextStyle(color: Color(0xFF4285F4), fontSize: 13, fontWeight: FontWeight.w700)), _loginWithGoogle, dark),
              const SizedBox(height: 5),
              _ssoButton(tr('Continue with Microsoft', 'Microsoft மூலம் தொடரவும்'), const Text('▦', style: TextStyle(color: Color(0xFF0078D4), fontSize: 15, fontWeight: FontWeight.w700)), _loginWithGoogle, dark),
              const SizedBox(height: 5),
              _ssoButton(tr('Company SSO (SAML)', 'நிறுவன SSO (SAML)'), const Icon(Icons.person_outline, size: 14), _loginWithGoogle, dark),
              const SizedBox(height: 14),
              Divider(color: dark ? const Color(0xFF344462) : const Color(0xFFE8EAF0)),
              const SizedBox(height: 9),
              Center(
                child: Wrap(alignment: WrapAlignment.center, children: [
                  Text(tr('New to Stackly? ', 'Stackly-க்கு புதிதா? '), style: GoogleFonts.inter(fontSize: 9, color: dark ? const Color(0xFFB7C5DA) : AppTheme.muted)),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.register),
                    child: Text(tr('Create an account', 'கணக்கை உருவாக்கவும்'), style: TextStyle(fontSize: 9, color: dark ? const Color(0xFF77B5FF) : AppTheme.darkNavy, fontWeight: FontWeight.w600)),
                  ),
                ]),
              ),
            ],
          ],
        ),
      ),
      );
      }),
    );
  }

  Widget _label(String value, {bool dark = false}) => Text(value, style: GoogleFonts.inter(color: dark ? Colors.white : AppTheme.ink, fontSize: 10, fontWeight: FontWeight.w600));

  Widget _ssoButton(String label, Widget icon, VoidCallback onPressed, bool dark) => SizedBox(
        width: double.infinity,
        height: 34,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: Text(label, style: TextStyle(fontSize: 10, color: dark ? Colors.white : AppTheme.ink, fontWeight: FontWeight.w400)),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: dark ? const Color(0xFF344462) : AppTheme.border),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
      );

  void _loginWithGoogle() {
    ref.read(userProvider.notifier).login('googleuser@gmail.com');
    context.go(AppRoutes.dashboard);
  }
}
