import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/bloc/trip_bloc.dart';

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
    // context.read<TripBloc>().add(GetTrips());
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Text(
                  "Todays Trips",
                  style: TextStyle(fontSize: 20),
                ),
                Gap(20),
              ],
            ),
          ),
        );
      },
    );
  }
}
