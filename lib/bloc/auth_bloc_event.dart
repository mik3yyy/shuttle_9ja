part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class ReqeustSignup extends AuthBlocEvent {
  final Map<String, dynamic> data;
  ReqeustSignup({required this.data});
}

class ReqeustVerify extends AuthBlocEvent {
  final String pin;
  ReqeustVerify({required this.pin});
}

class AuthenticateEvent extends AuthBlocEvent {}

class ResendOTPEvent extends AuthBlocEvent {
  final String email;
  final String password;
  ResendOTPEvent({required this.email, required this.password});
}

class SignInEvent extends AuthBlocEvent {
  final String email;
  final String password;
  SignInEvent({required this.email, required this.password});
}

class SignOutEvent extends AuthBlocEvent {}
