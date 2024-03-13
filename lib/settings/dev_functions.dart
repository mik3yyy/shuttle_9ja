import 'package:intl/intl.dart';
import 'package:user_repository/src/models/model.dart';

class Dev {
  static String formatMoney(double amount) {
    final NumberFormat formatter =
        NumberFormat.currency(symbol: '₦ ', decimalDigits: 2);
    return formatter.format(amount);
  }

  static String shortformatMoney(double amount) {
    if (amount >= 1000) {
      // Amount is in thousands, represent as 'k'
      int thousands = (amount ~/ 1000); // Get the thousands part
      return '₦ ${thousands}k';
    } else {
      // Amount is below 1000, format as currency with two decimal places
      final NumberFormat formatter =
          NumberFormat.currency(symbol: '₦', decimalDigits: 2);
      return formatter.format(amount);
    }
  }

  static double calculateDurationInHours(
      DateTime departureTime, DateTime arrivalTime) {
    Duration duration = arrivalTime.difference(departureTime);
    return duration.inHours.toDouble();
  }

  static displayTime(DateTime departureTime, DateTime arrivalTime) {
    String departure = formatTime(departureTime);
    String arrival = formatTime(arrivalTime);
    return '$departure - $arrival';
  }

  static String formatTime(DateTime time) {
    String period = time.hour >= 12 ? 'pm' : 'am';
    int hour = time.hour > 12 ? time.hour - 12 : time.hour;
    String minutes = time.minute.toString().padLeft(2, '0');
    return '$hour:$minutes $period';
  }

  static String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now).inDays;

    if (difference <= 7 && difference >= 0) {
      // Within a week, display as "Wednesday, 20th of January, 2024"
      return DateFormat('EEEE, d MMMM, yyyy').format(dateTime);
    } else {
      // More than a week, display as "20/1/2024"
      return DateFormat('d/M/yyyy').format(dateTime);
    }
  }

  static String getStatus(int capacity, int bookedSeats) {
    int availableSeats = capacity - bookedSeats;
    double percentFull = availableSeats / capacity * 100;
    // print(percentFull);
    if (percentFull < 10) {
      return 'Almost Full';
    } else {
      return 'Available';
    }
  }

  static String getShortMonth(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return ''; // You can handle invalid month numbers here
    }
  }

  static Map<String, List<Trip>> categorizeTrips(List<Trip> trips) {
    // Get current time
    final now = DateTime.now();
    // Normalize the current time to midnight for comparison
    final today = DateTime(now.year, now.month, now.day + 2);
    final tomorrow = today.add(Duration(days: 1));

    List<Trip> tripsToday = [];
    List<Trip> tripsTomorrow = [];
    List<Trip> tripsLater = [];

    for (Trip trip in trips) {
      // Normalize the departure time to midnight for comparison
      final departureDay = DateTime(trip.departureTime.year,
          trip.departureTime.month, trip.departureTime.day);

      if (departureDay.isAtSameMomentAs(today)) {
        tripsToday.add(trip);
      } else if (departureDay.isAtSameMomentAs(tomorrow)) {
        tripsTomorrow.add(trip);
      } else if (departureDay.isAfter(tomorrow)) {
        tripsLater.add(trip);
      }
    }

    return {
      'tripsToday': tripsToday,
      'tripsTomorrow': tripsTomorrow,
      'tripsLater': tripsLater
    };
  }
}
