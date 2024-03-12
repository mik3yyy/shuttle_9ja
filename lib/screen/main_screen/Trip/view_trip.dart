import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/settings/constants.dart';
import 'package:shuttle_9ja/settings/dev_functions.dart';
import 'package:user_repository/src/models/model.dart';

class ViewTrip extends StatefulWidget {
  const ViewTrip({super.key, required this.trip});
  final Trip trip;
  @override
  State<ViewTrip> createState() => _ViewTripState();
}

class _ViewTripState extends State<ViewTrip> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context, title: 'Trip Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  Constants.profile,
                  height: MediaQuery.sizeOf(context).height * .3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    height: 50,
                    // width: 100,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.5),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.trip.buses[currentIndex].model,
                          style: TextStyle(
                            color: Constants.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.trip.buses.length != 1)
                    Container(
                      // margin: EdgeInsets.all(5),
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => Gap(10),
                        itemCount: widget.trip.buses.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: currentIndex == index
                                    ? Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )
                                    : null,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(Constants.profile),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  Gap(10),
                  Center(
                    child: CustomButton(
                        onTap: () {},
                        title: "Book ${widget.trip.buses[currentIndex].model}"),
                  ),
                  Divider(),
                  // Text(
                  //   "Buses",
                  //   style: TextStyle(fontWeight: FontWeight.w700),
                  // ),
                  // Text(
                  //   'Trip Details',
                  //   style: TextStyle(
                  //     color: Theme.of(context).primaryColorDark,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lagos ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            size: 20,
                          ),
                          Text(
                            " Abuja",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.clock),
                          Gap(10),
                          Text(
                            Dev.calculateDurationInHours(
                                        widget.trip.departureTime,
                                        widget.trip.arrivalTime)
                                    // .ceil()
                                    .toString() +
                                " hr",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Gap(10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Dev.formatDate(widget.trip.arrivalTime),
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Dev.displayTime(widget.trip.departureTime,
                                widget.trip.arrivalTime)
                            // .ceil()
                            .toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Gap(10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Dev.formatMoney(widget.trip.price),
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trip Type',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.trip.tripType,
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Company',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.trip.transco.companyName,
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.trip.transco.address,
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Gap(30),

                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Capacity',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.trip.buses[currentIndex].capacity} seats",
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Booked Seats',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.trip.buses[currentIndex].bookedSeats + widget.trip.buses[currentIndex].assignedNumberOfSeats} seats",
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${Dev.getStatus(widget.trip.buses[currentIndex].capacity, widget.trip.buses[currentIndex].bookedSeats + widget.trip.buses[currentIndex].assignedNumberOfSeats)}",
                        // .ceil()
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
