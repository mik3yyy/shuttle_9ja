import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:user_repository/src/url.dart';
import 'package:user_repository/user_repository.dart';

class UserDataProvider {
  static Future<String> signUp(Map data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/auth/user/signup',
        ),
        body: data,
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> signIn(String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/auth/user/login',
        ),
        body: {'email': email, 'password': password},
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> verify(String pin) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/auth/user/verify',
        ),
        body: {'pin': pin},
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> resendOTP({required String email}) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/auth/user/verify/resend',
        ),
        body: {
          'email': email,
        },
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> updateUser(
      {required Map<String, dynamic> user, required String token}) async {
    try {
      final res = await http.put(
        Uri.parse(
          '${url}/user/profile/update',
        ),
        headers: {'authorization': 'Bearer $token'},
        body: user,
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> changePassword(
      {required Map<String, dynamic> data, required String token}) async {
    try {
      final res = await http.patch(
        Uri.parse(
          '${url}/user/profile/update-password',
        ),
        headers: {'authorization': 'Bearer $token'},
        body: data,
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> forgotPassword({
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/user/forgot-password',
        ),
        body: data,
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> resetPassword({
    required Map<String, dynamic> data,
  }) async {
    try {
      print('-------------');
      final res = await http.post(
        Uri.parse(
          '${url}/auth/user/reset-password',
        ),
        body: data,
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }

  // static Future<String> uploadPhoto(
  //     {required Map<String, dynamic> data, required String token}) async {
  //   try {
  //     print("-------------");
  //     File file = data['file'];
  //     final res = await http.post(
  //         Uri.parse(
  //           '${url}/user/profile/photo',
  //         ),
  //         headers: {
  //           'authorization': 'Bearer $token',
  //           // "Content-Type": "multipart/form-data"
  //         },
  //         body: {
  //           'file': file.readAsBytesSync().toString()
  //         }
  //         // encoding: Encoding.getByName("utf-8"),
  //         );

  //     return res.body;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  static Future<String> uploadPhoto(
      {required File file, required String token}) async {
    Dio dio = Dio();
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    Response response = await dio.post(
      '$url/user/profile/photo',
      data: formData,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }, contentType: 'application/json'

          // Note: Removed contentType to let Dio handle it automatically
          ),
    );
    print(response);
    if (response.statusCode == 200) {
      // Assuming server returns a string response
      return response.data.toString();
    } else {
      // Handle server error
      return 'Error: Server responded with status code ${response.statusCode}';
    }
  }
}
