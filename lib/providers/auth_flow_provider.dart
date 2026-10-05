import 'dart:math';

import 'package:flutter/foundation.dart';

class AuthFlowProvider extends ChangeNotifier {
  bool _otpRequested = false;
  String _verificationCode = '';
  String _errorMessage = '';

  bool get otpRequested => _otpRequested;
  String get verificationCode => _verificationCode;
  String get errorMessage => _errorMessage;

  void requestOtp({required String email, required String password, required bool credentialsValid}) {
    _errorMessage = '';
    if (email.trim().isEmpty || password.isEmpty) {
      _errorMessage = 'Enter your work email and password to continue.';
    } else if (!credentialsValid) {
      _errorMessage = 'We could not verify those sign-in details.';
    } else {
      _verificationCode = (100000 + Random().nextInt(900000)).toString();
      _otpRequested = true;
    }
    notifyListeners();
  }

  bool verifyOtp(String code) {
    _errorMessage = code.trim() == _verificationCode
        ? ''
        : 'That code is incorrect. Check it and try again.';
    notifyListeners();
    return _errorMessage.isEmpty;
  }

  void backToCredentials() {
    _otpRequested = false;
    _verificationCode = '';
    _errorMessage = '';
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
