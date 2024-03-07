import 'package:http/http.dart' as http;
import 'package:user_repository/src/url.dart';

class UserDataProvider {
  static Future<String> signUp(Map data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '${url}/api/v1/auth/user/signup',
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
          '${url}/api/v1/auth/user/login',
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
          '${url}/api/v1/auth/user/verify',
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
          '${url}/api/v1/auth/user/verify/resend',
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
}
