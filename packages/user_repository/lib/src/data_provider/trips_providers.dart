import 'package:http/http.dart' as http;
import 'package:user_repository/user_repository.dart';

class TripsDataProvider {
  static Future<String> getTrips() async {
    try {
      final res = await http.get(
        Uri.parse(
          '${url}/transco/trips',
        ),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
