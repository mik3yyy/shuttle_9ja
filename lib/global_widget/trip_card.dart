import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/screen/main_screen/Trip/view_trip.dart';
import 'package:shuttle_9ja/settings/constants.dart';
import 'package:shuttle_9ja/settings/dev_functions.dart';
import 'package:user_repository/src/models/model.dart';

class TripCard extends StatefulWidget {
  const TripCard({super.key, required this.trip});
  final Trip trip;
  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // padding: EdgeInsets.all(10),
        width: 180,
        height: 200,
        // decoration: BoxDecoration(color: Constants.black),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    Constants.profile,
                    height: 140,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Lagos ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 10,
                                ),
                                Text(
                                  " Abuja",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              Dev.calculateDurationInHours(
                                          widget.trip.departureTime,
                                          widget.trip.arrivalTime)
                                      .ceil()
                                      .toString() +
                                  " hr",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )

                            // Text()
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              Dev.shortformatMoney(widget.trip.price),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            // Text(Dev.displayTime(widget.trip.departureTime,
                            //     widget.trip.arrivalTime))

                            SizedBox(
                              height: 30,
                              child: CustomButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewTrip(
                                        trip: widget.trip,
                                      ),
                                    ),
                                  );
                                },
                                title: "View",
                                width: 70,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                width: 80,
                height: 40,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Constants.black.withOpacity(0.4),
                ),
                child: Center(
                  child: Text(
                    widget.trip.transco.companyName,
                    style: TextStyle(
                      color: Constants.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
