












import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final String registeredName;
  final String registeredEmail;
  final String registeredPassword;
  final String name;
  final String email;
  final bool isLoggedIn;

  const UserState({
    this.registeredName = '',
    this.registeredEmail = '',
    this.registeredPassword = '',
    this.name = '',
    this.email = '',
    this.isLoggedIn = false,
  });

  UserState copyWith({
    String? registeredName,
    String? registeredEmail,
    String? registeredPassword,
    String? name,
    String? email,
    bool? isLoggedIn,
  }) {
    return UserState(
      registeredName: registeredName ?? this.registeredName,
      registeredEmail: registeredEmail ?? this.registeredEmail,
      registeredPassword: registeredPassword ?? this.registeredPassword,
      name: name ?? this.name,
      email: email ?? this.email,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class UserNotifier extends Notifier<UserState> {
  @override
  UserState build() {
    return const UserState();
  }

  void register(String name, String email, String password) {
    state = state.copyWith(
      registeredName: name,
      registeredEmail: email,
      registeredPassword: password,
    );
  }

  bool validateLogin(String email, String password) {
    return email == state.registeredEmail &&
        password == state.registeredPassword;
  }

  void login(String email) {
    state = state.copyWith(
      name: state.registeredName,
      email: email,
      isLoggedIn: true,
    );
  }

  bool emailExists(String email) {
    return email == state.registeredEmail;
  }

  void resetPassword(String email, String newPassword) {
    if (email == state.registeredEmail) {
      state = state.copyWith(registeredPassword: newPassword);
    }
  }

  void logout() {
    state = state.copyWith(name: '', email: '', isLoggedIn: false);
  }
}

final userProvider = NotifierProvider<UserNotifier, UserState>(
  UserNotifier.new,
);
