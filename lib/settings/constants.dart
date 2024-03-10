// import 'package:cloudinary/cloudinary.dart';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static String url =
      "https://api.kiasup.com/api/v1"; //"https://api.kiasup.com/api/v1";
  // "http://api.devbracket.tech/api/v1";
  // "https://backend.kiasup.com/api/v1/"; //https://api.kiasup.com/api/v1";
  // "https://dev.kiasup.com/api/v1";

  //https://api.kiasup.com/api/v1
// Exception occurred: DioException [bad response]: This exception was thrown because the response has a status code of 401 and RequestOptions.validateStatus was configured to throw for this status code.
// The status code of 401 has the following meaning: "Client error - the request contains bad syntax or cannot be fulfilled"
  //COLOUR
  static Color red = Color(0xFFA82427);
  static Color grey = Colors.grey;
  static Color white = Color(0xFFFFFFFF);
  static Color lightRed = Color(0xFFF7A1A3);
  static Color black = Colors.black;
  static Color lightGrey = Color(0xFFF7F7F7);
  static Color appBarRed = Color(0xFFF15B5F);
  static Color searchCardWhite = Color(0xFFF4F4F4).withOpacity(0.9);
  static Color messageBubbleWhite = Color(0xFFE3E9EC);
  static Color primaryColor = Color(0xFF037743);
  static Color baseColor = Color(0xFFB9E5D1);

// F7A1A3
  ///STYLE
  ///
  static String hashPassword(String password) {
    var bytes = utf8.encode(password); // data being hashed

    var digest = sha1.convert(bytes);
    return digest.toString();
  }

  static TextStyle title = const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
  );
  static TextStyle Inter = TextStyle();

  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Constants.grey));
  ////
  static String nairaSymbol = "₦";

  static String profile =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

  static Widget gap({double width = 0, double height = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static String formatWhatsAppTimestamp(DateTime timestamp) {
    DateTime now = DateTime.now();
    DateTime justNow = DateTime(now.year, now.month, now.day);

    if (timestamp.isAfter(justNow)) {
      // If the message was sent today, show only the time
      return DateFormat('h:mm a').format(timestamp);
    } else if (now.year == timestamp.year) {
      // If the message was sent this year, show month and day
      return DateFormat('MMM d').format(timestamp);
    } else {
      // If the message was sent in a different year, show full date
      return DateFormat('MM/dd/yyyy').format(timestamp);
    }
  }

  static String formatAsMoney(double value) {
    NumberFormat currencyFormatter = NumberFormat('#,##0.00', 'en_US');
    return currencyFormatter.format(value);
  }

  static Future<void> checkForUpdate() async {
    try {
      InAppUpdate.checkForUpdate().then((info) {
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          InAppUpdate.startFlexibleUpdate();
        }
      });
    } catch (e) {}
  }

  // static Cloudinary CloudinaryKey = Cloudinary.signedConfig(
  //   apiKey: "874717381394155",
  //   apiSecret: "ZTmhSr37rING35sb3Su2PT73H6s",
  //   cloudName: "dejprz6mk",
  // );
  static Future<void> LaunchUrl(String url, BuildContext context) async {
    if (!await launchUrl(Uri.parse(url))) {
      final snackBar = SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Constants.red,
          content: const Text(
            "Unable to open link",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
