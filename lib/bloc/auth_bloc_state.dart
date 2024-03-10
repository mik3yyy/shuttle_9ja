// ignore: must_be_immutable

part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {
  User? user;
}

final class AuthBlocInitial extends AuthBlocState {}

final class Loading extends AuthBlocState {}

final class AuthError extends AuthBlocState {
  final String message;
  AuthError({required this.message});
}

final class AuthSucess extends AuthBlocState {
  final String message;
  AuthSucess({required this.message});
}

final class Unathenticated extends AuthBlocState {
  final String email;
  final String password;
  Unathenticated({required this.email, required this.password});
}

final class Authenticated extends AuthBlocState {
  final User user;
  final String token;
  Authenticated({required this.user, required this.token});
}
// final class UploadPhoto extends AuthBlocState {}

