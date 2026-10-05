































import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_theme.dart';
import '../../providers/user_provider.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showPasswordFields = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  String message = '';
  bool isSuccess = false;

  void checkEmail() {
    final String email = emailController.text.trim();

    setState(() {
      message = '';
      isSuccess = false;
    });

    if (email.isEmpty) {
      setState(() {
        message = 'Please enter your email.';
      });
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      setState(() {
        message = 'Please enter a valid email address.';
      });
      return;
    }

    if (!ref.read(userProvider.notifier).emailExists(email)) {
      setState(() {
        message = 'No registered account found with this email.';
      });
      return;
    }

    setState(() {
      showPasswordFields = true;
      message = 'Email verified. Enter your new password.';
      isSuccess = true;
    });
  }

  void resetPassword() {
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    setState(() {
      message = '';
      isSuccess = false;
    });

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        message = 'Please enter your new password.';
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        message = 'Password must be at least 6 characters.';
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        message = 'Passwords do not match.';
      });
      return;
    }

    ref
        .read(userProvider.notifier)
        .resetPassword(emailController.text.trim(), password);

    setState(() {
      message = 'Password reset successful! You can now login.';
      isSuccess = true;
      passwordController.clear();
      confirmPasswordController.clear();
    });
  }

  void backToLogin() {
    context.pop();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration(
    String label,
    IconData icon, {
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.roboto(
        color: Colors.blueGrey.shade500,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Icon(icon, color: AppTheme.primaryBlue, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF4F8FC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppTheme.primaryBlue.withValues(alpha: 0.08),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE1E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppTheme.primaryBlue, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkNavy,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              AppTheme.darkNavy,
              AppTheme.primaryBlue,
              AppTheme.lightBlue,
            ],
            stops: <double>[0.0, 0.58, 1.0],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(top: -80, right: -60, child: _backgroundCircle(220)),
            Positioned(bottom: -120, left: -90, child: _backgroundCircle(280)),
            SafeArea(
              child: Column(
                children: <Widget>[
                  _topBrandBar(),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 18, 24, 32),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 440),
                          child: _forgotPasswordCard(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.06),
      ),
    );
  }

  Widget _topBrandBar() {
    return Container(
      width: double.infinity,
      color: MediaQuery.sizeOf(context).width < 760
          ? Colors.black
          : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 14),
        child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: Image.asset(
              'assets/images/onecloud_logo.png',
              height: 34,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          Text(
            'Enterprise Platform',
            style: GoogleFonts.roboto(
              color: Colors.white.withValues(alpha: 0.82),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _forgotPasswordCard() {
    return Card(
      elevation: 18,
      shadowColor: Colors.black.withValues(alpha: 0.28),
      color: Colors.white.withValues(alpha: 0.97),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.70)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[AppTheme.primaryBlue, AppTheme.darkNavy],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.primaryBlue.withValues(alpha: 0.22),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.lock_reset_rounded,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Reset your password',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: AppTheme.darkNavy,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              showPasswordFields
                  ? 'Create a new secure password for your OneCloud account.'
                  : 'Verify your registered email to securely reset your OneCloud password.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.blueGrey.shade600,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 26),
            _fieldLabel('ACCOUNT EMAIL'),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              enabled: !showPasswordFields,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: inputDecoration(
                'Enter your registered email',
                Icons.email_outlined,
              ),
            ),
            if (!showPasswordFields) ...<Widget>[
              const SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: checkEmail,
                  icon: const Icon(Icons.verified_outlined, size: 18),
                  label: Text(
                    'Verify Email',
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
            if (showPasswordFields) ...<Widget>[
              const SizedBox(height: 20),
              _fieldLabel('NEW PASSWORD'),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                textInputAction: TextInputAction.next,
                decoration: inputDecoration(
                  'Enter new password',
                  Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              _fieldLabel('CONFIRM PASSWORD'),
              const SizedBox(height: 8),
              TextField(
                controller: confirmPasswordController,
                obscureText: hideConfirmPassword,
                onSubmitted: (_) => resetPassword(),
                decoration: inputDecoration(
                  'Confirm new password',
                  Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.lightBlue.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      Icons.security_outlined,
                      size: 18,
                      color: AppTheme.primaryBlue,
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        'Use at least 6 characters for your new password.',
                        style: GoogleFonts.roboto(
                          color: AppTheme.darkNavy,
                          fontSize: 11,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: resetPassword,
                  icon: const Icon(Icons.check_circle_outline, size: 18),
                  label: Text(
                    'Reset Password',
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
            if (message.isNotEmpty) ...<Widget>[
              const SizedBox(height: 18),
              _messageBox(),
            ],
            const SizedBox(height: 18),
            TextButton.icon(
              onPressed: backToLogin,
              icon: const Icon(Icons.arrow_back_rounded, size: 16),
              label: Text(
                'Back to Login',
                style: GoogleFonts.roboto(
                  color: AppTheme.primaryBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.verified_user_outlined,
                  size: 14,
                  color: Colors.blueGrey.shade400,
                ),
                const SizedBox(width: 5),
                Text(
                  'OneCloud Enterprise Security',
                  style: GoogleFonts.roboto(
                    color: Colors.blueGrey.shade400,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: AppTheme.darkNavy,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _messageBox() {
    final Color messageColor = isSuccess
        ? Colors.green.shade700
        : Colors.red.shade700;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: messageColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: messageColor.withValues(alpha: 0.16)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            isSuccess ? Icons.check_circle_outline : Icons.error_outline,
            size: 18,
            color: messageColor,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.roboto(
                color: messageColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
