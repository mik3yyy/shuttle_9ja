import 'package:flutter/material.dart';
import 'package:shuttle_9ja/settings/dev_functions.dart';
import 'package:user_repository/src/models/booking.dart';

class ViewTicket extends StatelessWidget {
  final Booking booking;

  ViewTicket({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Booking ID',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${booking.id}'),
            ),

            ListTile(
              title: Text('Transco'),
              subtitle: Text('${booking.transco.companyName}'),
            ),
            ListTile(
              title: Text('Departure Time'),
              subtitle: Text(
                  '${Dev.formatDate(booking.route.departureTime)} ${Dev.formatTime(booking.route.departureTime)}'),
            ),
            ListTile(
              title: Text('Arrival Time'),
              subtitle: Text(
                  '${Dev.formatDate(booking.route.arrivalTime)} ${Dev.formatTime(booking.route.arrivalTime)}'),
            ),
            ListTile(
              title: Text('Bus'),
              subtitle: Text('${booking.bus.model}'),
            ),
            ListTile(
              title: Text('Seats Booked'),
              subtitle: Text('${booking.noOfSeatsBooked}'),
            ),
            ListTile(
              title: Text('Price'),
              subtitle: Text('${booking.route.price}'),
            ),
            ListTile(
              title: Text('Trip Type'),
              subtitle: Text('${booking.route.tripType}'),
            ),
            // Add more relevant details here based on your requirements
          ],
        ),
      ),
    );
  }

  Widget buildTile(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(key), Text(value)],
    );
  }
}
