import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:redacted/redacted.dart';
import 'package:shuttle_9ja/bloc/trip_bloc.dart';
import 'package:shuttle_9ja/settings/constants.dart';

class TripShimmer extends StatefulWidget {
  const TripShimmer({
    super.key,
  });

  @override
  State<TripShimmer> createState() => _TripShimmerState();
}

class _TripShimmerState extends State<TripShimmer> {
  late Trips trips;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 180,
      height: 200,
      // decoration: BoxDecoration(color: Constants.black),
      child: Column(
        children: [
          Image.network(
            Constants.profile,
            height: 140,
            width: 180,
            fit: BoxFit.cover,
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Lagos',
                    style: TextStyle(fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_forward_outlined,
                    size: 10,
                  ),
                  Text(
                    "Abuja",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              // Text()
            ],
          )
        ],
      ),
    ).redacted(context: context, redact: true);
  }
}
