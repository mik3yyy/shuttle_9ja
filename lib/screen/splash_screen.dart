import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/screen/auth_screen/overview.dart';
import 'package:shuttle_9ja/screen/main_screen/main_screen.dart';
import 'package:shuttle_9ja/services/hive_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = '/splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      if (HiveFunction.tokenExist()) {
        context.read<AuthBlocBloc>().add(
              RestoreEvent(
                  userEntity: HiveFunction.getUser(),
                  token: HiveFunction.getToken()),
            );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OverviewScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
        ),
      ),
    );
  }
}
