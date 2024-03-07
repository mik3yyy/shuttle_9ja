import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:user_repository/src/user_impls.dart';
import 'package:user_repository/src/models/user.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final userRepoImp userRepo;
  AuthBlocBloc({required this.userRepo}) : super(AuthBlocInitial()) {
    on<ReqeustSignup>(_requestSignUp);
    on<SignInEvent>(_signIn);
    on<SignOutEvent>(_signOut);
    on<AuthenticateEvent>(_authenticate);
    on<ReqeustVerify>(_verify);
    on<ResendOTPEvent>(_resendOtp);
  }
  _resendOtp(ResendOTPEvent event, Emitter emit) async {
    try {
      emit(Loading());

      Map<String, dynamic> res = await userRepo.resendOTP(
          email: event.email, password: event.password);
      if (res['success']) {
        emit(AuthSucess(message: res['message']));
      } else {
        emit(AuthError(message: res['message']));
      }
    } catch (e) {
      emit(AuthError(
          message: e.runtimeType.toString() ?? "Something went wrong"));
    }
  }

  _verify(ReqeustVerify event, Emitter emit) async {
    try {
      emit(Loading());

      Map<String, dynamic> res = await userRepo.verifyEmail(
        pin: event.pin,
      );
      if (res['success']) {
        emit(AuthBlocInitial());
      } else {
        emit(AuthError(message: res['message']));
      }
    } catch (e) {
      emit(AuthError(
          message: e.runtimeType.toString() ?? "Something went wrong"));
    }
  }

  _signIn(SignInEvent event, Emitter emit) async {
    try {
      emit(Loading());

      Map<String, dynamic> res =
          await userRepo.signIn(email: event.email, password: event.password);
      if (res['success']) {
        emit(
          Authenticated(
            user: User.fromJson(res['data']['user']),
            token: res['data']['token'],
          ),
        );
      } else {
        print(res['message']);

        emit(AuthError(message: res['message']));

        if (res['message'] == 'Please verify your Email address.') {
          await Future.delayed(Duration(milliseconds: 400), () {
            emit(Unathenticated(email: event.email, password: event.password));
          });
        }
      }
    } catch (e) {
      emit(AuthError(message: "Something went wrong"));
    }
    // emit(Authenticated(user: user));
  }

  _authenticate(AuthenticateEvent event, Emitter emit) {
    // emit(Authenticated(user: User.fill()));
  }

  _requestSignUp(ReqeustSignup event, Emitter emit) async {
    emit(Loading());
    Map<String, dynamic> data = event.data;
    Map<String, dynamic> res = await userRepo.singUp(data);
    print(res);
    if (res['success']) {
      emit(Unathenticated(email: data['email'], password: data['password']));
    } else {
      if (res['message'] == "Email already exists.") {
        emit(AuthBlocInitial());
      }
      emit(AuthError(message: res['message']));
    }
  }

  _signOut(SignOutEvent event, Emitter emit) {}
}
