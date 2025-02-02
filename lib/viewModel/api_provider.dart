import 'package:archive_app2/models/auth_model.dart';
import 'package:archive_app2/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class AuthState {
  final AuthModel? authModel;
  final bool isLoading;
  final String? errorMessage;

  AuthState({this.authModel, this.isLoading = false, this.errorMessage});
}

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthService _authService;
  final GetStorage _storage = GetStorage();

  AuthViewModel(this._authService) : super(AuthState());

  Future<void> login(String email, String password, BuildContext context) async {
    state = AuthState(isLoading: true); // Yüklenme başlatıldı

    try {
      final authModel = await _authService.login(email, password, context);

      if (authModel == null) {
        state = AuthState(isLoading: false, errorMessage: "Geçersiz giriş!");
        return;
      }

      // Token'ı sakla
      await TokenManager.saveToken(authModel.data?.accessToken ?? '');

      state = AuthState(authModel: authModel, isLoading: false);

      Navigator.pushNamed(context, '/home', arguments: authModel.data?.user);
    } catch (e) {
      state = AuthState(isLoading: false, errorMessage: "Giriş sırasında hata oluştu: $e");
      print('Login error: $e');
    }
  }

  void logout() {
    // Token'ı temizle
    TokenManager.clearToken();
    state = AuthState();
  }
}

// Provider tanımlaması
final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(AuthService());
});
