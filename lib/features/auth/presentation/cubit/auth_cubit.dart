import 'package:devpaul_eats/core/usecases/usecase.dart';
import 'package:devpaul_eats/features/auth/domain/entities/app_user.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:devpaul_eats/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:devpaul_eats/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthCubit(
    this._signInUseCase,
    this._signUpUseCase,
    this._signOutUseCase,
    this._getCurrentUserUseCase,
  ) : super(const AuthState.initial());

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    final result = await _getCurrentUserUseCase(const NoParams());
    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (user) {
        if (user != null) {
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> signIn(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _signInUseCase(
      SignInParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
    UserRole role,
  ) async {
    emit(const AuthState.loading());
    final result = await _signUpUseCase(
      SignUpParams(
        email: email,
        password: password,
        name: name,
        role: role,
      ),
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> signOut() async {
    emit(const AuthState.loading());
    final result = await _signOutUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
