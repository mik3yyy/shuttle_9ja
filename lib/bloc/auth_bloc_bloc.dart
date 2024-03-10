import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/services/Hive/user_entity.dart';
import 'package:shuttle_9ja/services/hive_function.dart';
import 'package:user_repository/src/user_implementation.dart';
import 'package:user_repository/src/models/user.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final userRepoImp userRepo;
  AuthBlocBloc({required this.userRepo}) : super(AuthBlocInitial()) {
    on<ReqeustSignup>(_requestSignUp);
    on<SignInEvent>(_signIn);
    on<RestoreEvent>(_restore);
    on<SignOutEvent>(_signOut);
    on<AuthenticateEvent>(_authenticate);
    on<ReqeustVerify>(_verify);
    on<ResendOTPEvent>(_resendOtp);
    on<ReqeustUpdateProfile>(_updateProfile);
    on<ChnagePasswordEvent>(_changePassword);
    on<UploadPhoto>(_uploadPhoto);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<ResetPasswordEvent>(_resetPassword);
  }
  _resetPassword(ResetPasswordEvent event, Emitter emit) async {
    try {
      emit(Loading());
      Map<String, dynamic> res = await userRepo.resetPassword({
        'newPassword': event.password,
        'confirmPassword': event.confirmPassword,
        'token': event.otp
      });
      if (res['success']) {
        emit(AuthSucess(message: res['message']));
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      } else {
        if (res['errors'] is List) {
          emit(AuthError(message: res['errors'][0]));
        } else {
          emit(AuthError(message: res['message']));
        }
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(AuthBlocInitial());
        });
      }
    } catch (e) {
      print(e.toString());
      emit(AuthError(message: "Something went wrong"));
    }
  }

  _forgotPassword(ForgotPasswordEvent event, Emitter emit) async {
    try {
      emit(Loading());
      Map<String, dynamic> res = await userRepo.forgotPassword({
        'email': event.email,
      });
      if (res['success']) {
        emit(AuthSucess(message: res['message']));
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      } else {
        if (res['errors'] is List) {
          emit(AuthError(message: res['errors'][0]));
        } else {
          emit(AuthError(message: res['message']));
        }
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(AuthBlocInitial());
        });
      }
    } catch (e) {
      print(e.toString());
      emit(AuthError(message: "Something went wrong"));
    }
  }

  _uploadPhoto(UploadPhoto event, Emitter emit) async {
    try {
      emit(Loading());

      Map<String, dynamic> res = await userRepo.uploadPhoto(
        event.file,
        HiveFunction.getToken(),
      );

      print(res);
      // emit(
      //   Authenticated(
      //     user: User.fromJson(event.userEntity.toJson()),
      //     token: event.token,
      //   ),
      // );
      if (res['success']) {
        emit(AuthSucess(message: res['message']));
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      } else {
        if (res['errors'] is List) {
          emit(AuthError(message: res['errors'][0]));
        } else {
          emit(AuthError(message: res['message']));
        }
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      }
    } catch (e) {
      emit(AuthError(
          message: e.runtimeType.toString() ?? "Something went wrong"));
    }
  }

  _changePassword(ChnagePasswordEvent event, Emitter emit) async {
    try {
      emit(Loading());

      Map<String, dynamic> res = await userRepo.changePassword(
        {
          'password': event.password,
          'newPassword': event.newPassword,
          'confirmPassword': event.confirmPassword
        },
        HiveFunction.getToken(),
      );

      print(res);
      // emit(
      //   Authenticated(
      //     user: User.fromJson(event.userEntity.toJson()),
      //     token: event.token,
      //   ),
      // );
      if (res['success']) {
        emit(AuthSucess(message: res['message']));
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      } else {
        if (res['errors'] is List) {
          emit(AuthError(message: res['errors'][0]));
        } else {
          emit(AuthError(message: res['message']));
        }
        await Future.delayed(Duration(milliseconds: 400), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      }
    } catch (e) {
      emit(AuthError(
          message: e.runtimeType.toString() ?? "Something went wrong"));
    }
  }

  _updateProfile(ReqeustUpdateProfile event, Emitter emit) async {
    try {
      emit(Loading());

      Map<String, dynamic> res =
          await userRepo.updateUser(event.data, event.token);
      print(res);
      print(res['message']);

      if (res['success']) {
        HiveFunction.insertUserAndToken(
          token: event.token,
          userEntity: UserEntity.fromJson(res['data']),
        );
        emit(AuthSucess(message: res['message']));
        await Future.delayed(Duration(seconds: 1), () {
          emit(
            Authenticated(
              user: User.fromJson(res['data']),
              token: HiveFunction.getToken(),
            ),
          );
        });
      } else {
        emit(AuthError(message: res['message']));
        await Future.delayed(Duration(milliseconds: 1), () {
          emit(Authenticated(
              user: User.fromJson(HiveFunction.getUser().toJson()),
              token: HiveFunction.getToken()));
        });
      }

      // if (res['success']) {
      //   emit(AuthBlocInitial());
      // } else {
      //   emit(AuthError(message: res['message']));
      // }
    } catch (e) {
      emit(AuthError(
          message: e.runtimeType.toString() ?? "Something went wrong"));
      await Future.delayed(Duration(milliseconds: 400), () {
        emit(Authenticated(
            user: User.fromJson(HiveFunction.getUser().toJson()),
            token: HiveFunction.getToken()));
      });
    }
  }

  _restore(RestoreEvent event, Emitter emit) async {
    try {
      emit(
        Authenticated(
          user: User.fromJson(event.userEntity.toJson()),
          token: event.token,
        ),
      );
    } catch (e) {
      emit(AuthError(
          message: e.runtimeType.toString() ?? "Something went wrong"));
    }
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
        UserEntity userEntity = UserEntity.fromUser(
          User.fromJson(res['data']['user']),
        );
        HiveFunction.insertUserAndToken(
          token: res['data']['token'],
          userEntity: userEntity,
        );
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
      print(e.toString());
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

  _signOut(SignOutEvent event, Emitter emit) {
    print("object");
    HiveFunction.deleteToken();
    HiveFunction.deleteUser();
    emit(AuthBlocInitial());
  }
}
