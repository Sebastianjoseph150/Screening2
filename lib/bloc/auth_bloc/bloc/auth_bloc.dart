import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:screening2/repositorys/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authrepo;
  AuthBloc({required this.authrepo}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignunEvent>(signunEvent);
    on<LoginButtonPressed>(loginButtonPressed);
  }

  FutureOr<void> signunEvent(SignunEvent event, Emitter<AuthState> emit) {
    try {
      authrepo.addUsername(event.password);
      emit(SiginSuccesstate());
    } catch (e) {
      emit(SigninFailuerState(error: e.toString()));
    }
  }

  FutureOr<void> loginButtonPressed(
      LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    final response = await authrepo.checkUsername(event.password);
    if (response == true) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailuerState(loginerror: "Check your user name and password"));
    }
    try {} catch (e) {
      throw (e);
    }
  }
}
