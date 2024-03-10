part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class ReqeustSignup extends AuthBlocEvent {
  final Map<String, dynamic> data;
  ReqeustSignup({required this.data});
}

class ReqeustUpdateProfile extends AuthBlocEvent {
  final Map<String, dynamic> data;
  final String token;
  ReqeustUpdateProfile({required this.data, required this.token});
}

class ReqeustVerify extends AuthBlocEvent {
  final String pin;
  ReqeustVerify({required this.pin});
}

class AuthenticateEvent extends AuthBlocEvent {}

class RestoreEvent extends AuthBlocEvent {
  final UserEntity userEntity;
  final String token;

  RestoreEvent({required this.userEntity, required this.token});
}

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

class ForgotPasswordEvent extends AuthBlocEvent {
  final String email;

  ForgotPasswordEvent({required this.email});
}

class ResetPasswordEvent extends AuthBlocEvent {
  final String otp;
  final String password;
  final String confirmPassword;

  ResetPasswordEvent(
      {required this.otp,
      required this.password,
      required this.confirmPassword});
}

class UploadPhoto extends AuthBlocEvent {
  final File file;

  UploadPhoto({required this.file});
}

class ChnagePasswordEvent extends AuthBlocEvent {
  final String password;
  final String newPassword;
  final String confirmPassword;
  // final String t;

  ChnagePasswordEvent({
    required this.password,
    required this.newPassword,
    required this.confirmPassword,
  });
}
