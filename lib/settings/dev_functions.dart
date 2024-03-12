import 'package:intl/intl.dart';

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
    double percentFull = bookedSeats / capacity * 100;
    print(percentFull);
    if (percentFull > 10) {
      return 'Almost Full';
    } else {
      return 'Available';
    }
  }
}
