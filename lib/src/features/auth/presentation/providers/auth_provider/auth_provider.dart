import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_library_app/src/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/auth_provider/auth_notifier.dart';
import 'package:student_library_app/src/features/auth/presentation/providers/auth_provider/auth_state.dart';
import 'package:student_library_app/src/services/storage_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepository();
  final storageService = StorageService();

  return AuthNotifier(
    authRepository: authRepository,
    storageService: storageService,
  );
});
