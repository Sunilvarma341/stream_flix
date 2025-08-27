import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_flix/data/local_storage/shared_preference.dart';
import 'package:stream_flix/data/repos/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepository;
  AuthBloc(this._authRepository ) : super(AuthInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authRepository.signUpWithEmail(
          event.email,
          event.password,
        );
        emit(Authenticated(user!));
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authRepository.signInWithEmail(
          event.email,
          event.password,
        );
        if (user == null) {
          emit(Unauthenticated(message: "No user found for that email."));
          return;
        }
        LocalStorage.saveUser(user);
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authRepository.signInWithGoogle();
        if (user != null) {
          LocalStorage.saveUser(user);
          emit(Authenticated(user));
        } else {
          emit(Unauthenticated(message: "Google Sign-In canceled"));
        }
      } catch (e) {
        emit(Unauthenticated(message: e.toString()));
      }
    });

    on<SignOutRequested>((event, emit) async {
      await _authRepository.signOut();
      emit(Unauthenticated());
    });
  }
}
