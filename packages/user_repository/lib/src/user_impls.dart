import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:user_repository/src/data_provider/user_provider.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class userRepoImp implements UserRepo {
  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement getUser
  User get getUser {
    return User.fill();
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> singUp(Map<String, dynamic> user) async {
    try {
      final res = await UserDataProvider.signUp(user);
      final data = jsonDecode(res);

      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    try {
      final res = await UserDataProvider.signIn(email, password);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> verifyEmail({required String pin}) async {
    try {
      final res = await UserDataProvider.verify(pin);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> resendOTP(
      {required String email, required String password}) async {
    // TODO: implement resendOTP
    try {
      final res = await UserDataProvider.resendOTP(email: email);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }
}
