import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:redacted/redacted.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/bloc/trip_bloc.dart';
import 'package:shuttle_9ja/global_widget/shimmers.dart';
import 'package:shuttle_9ja/global_widget/trip_card.dart';
import 'package:shuttle_9ja/settings/constants.dart';

// import 'package:';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "/";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TripBloc>().add(FetchTrips());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
                'Hello ${state.user?.firstName ?? ""} ${state.user?.lastName ?? ""}'),
          ),
          body: BlocConsumer<TripBloc, TripState>(
            listener: (context, state2) {
              // TODO: implement listener
            },
            builder: (context, state2) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Todays Trips",
                      style: TextStyle(fontSize: 20),
                    ),
                    Gap(20),
                    Container(
                      height: 240,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Gap(20),
                        scrollDirection: Axis.horizontal,
                        itemCount: state2 is Trips ? state2.trips.length : 3,
                        itemBuilder: (context, index) {
                          return state2 is Trips
                              ? TripCard(
                                  trip: state2.trips[index],
                                )
                              : TripShimmer();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
