import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/screen/auth_screen/login_screen/login_screen.dart';
import 'package:shuttle_9ja/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:shuttle_9ja/settings/constants.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding/welcome.png',
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 150,
          child: Column(
            children: [
              CustomButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                title: "Create an account",
              ),
              Gap(20),
              CustomButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                title: "Log in",
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                color: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ));
  }
}
