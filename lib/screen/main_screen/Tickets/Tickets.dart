import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:redacted/redacted.dart';
import 'package:shuttle_9ja/bloc/trip_bloc.dart';
import 'package:shuttle_9ja/cubit/book_cubit.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/screen/main_screen/Tickets/view_ticket.dart';
import 'package:shuttle_9ja/settings/dev_functions.dart';
import 'package:user_repository/src/models/model.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});
  static String id = '/';
  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BookCubit>().getTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context, pop: false, title: "Tickets"),
      body: BlocConsumer<BookCubit, BookState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              if (state is Bookings) ...[
                Expanded(
                  child: Scrollbar(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Gap(10),
                        itemCount: state.bookings.length,
                        itemBuilder: (context, index) {
                          Booking booking = state.bookings[index];
                          return Card(
                            child: ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewTicket(booking: booking))),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(booking.bus.image),
                              ),
                              title: Text(
                                'Abuja - > lagos',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle:
                                  Text(booking.hasPaid ? "Paid" : "Unpaid"),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    booking.route.departureTime.day.toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    Dev.getShortMonth(
                                      booking.route.departureTime.month,
                                    ),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ] else ...[
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                              // leading: Image.network(src),
                              )
                          .redacted(context: context, redact: true);
                    },
                  ),
                )
              ]
            ],
          );
        },
      ),
    );
  }
}
