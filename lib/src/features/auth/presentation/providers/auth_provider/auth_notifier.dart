import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_library_app/src/features/auth/domain/entities/entities.dart';
import 'package:student_library_app/src/features/auth/domain/repositories/abstract_auth_repository.dart';
import 'package:student_library_app/src/features/auth/infrastructure/infrastructure.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/auth_provider/auth_state.dart';
import 'package:student_library_app/src/services/abstract_storage_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AbstractAuthRepository authRepository;
  final AbstractStorageService storageService;

  AuthNotifier({
    required this.authRepository,
    required this.storageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.signIn(email, password);

      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Oops! something happened');
    }
  }

  Future<void> register(String email, String password) async {}
  Future<void> checkAuthStatus() async {
    final token = await storageService.getValueByKey<String>('token');
    if (token == null) return logout();

    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } catch (e) {
      logout();
    }
  }

  Future<void> logout([String? error]) async {
    await storageService.removeByKey('token');

    state = state.copyWith(
      user: null,
      status: AuthStatus.unauthenticated,
      errorMessage: error,
    );
  }

  void _setLoggedUser(User user) async {
    await storageService.setKeyValue('token', user.token);

    state = state.copyWith(
      user: user,
      status: AuthStatus.authenticated,
      errorMessage: '',
    );
  }
}
