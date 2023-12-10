part of 'authentication_cubit.dart';

sealed class AuthenticationState {}

final class AuthenticationSignedInState extends AuthenticationState {}

final class AuthenticationSignedOutState extends AuthenticationState {}

final class AuthenticationLoadingState extends AuthenticationState {}

final class AuthenticationErrorState extends AuthenticationState with EquatableMixin {
  AuthenticationErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
