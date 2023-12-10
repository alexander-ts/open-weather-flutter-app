import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_flutter_app/features/authentication/repositories/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.authenticationRepository) : super(AuthenticationSignedOutState()) {
    _authenticationStatusSub = authenticationRepository.isSignedInStream.listen((isSignedIn) {
      isSignedIn ? emit(AuthenticationSignedInState()) : emit(AuthenticationSignedOutState());
    });
  }

  final AuthenticationRepository authenticationRepository;

  late StreamSubscription _authenticationStatusSub;

  @override
  Future<void> close() {
    _authenticationStatusSub.cancel();
    return super.close();
  }

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthenticationLoadingState());
      await authenticationRepository.signIn(email, password);
    } catch (e) {
      emit(AuthenticationErrorState(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthenticationLoadingState());
      await authenticationRepository.signOut();
    } catch (e) {
      emit(AuthenticationErrorState(e.toString()));
    }
  }
}
