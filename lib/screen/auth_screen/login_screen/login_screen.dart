import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textbutton.dart';
import 'package:shuttle_9ja/global_widget/textfield.dart';
import 'package:shuttle_9ja/screen/auth_screen/verify_email/verify_email.dart';
import 'package:shuttle_9ja/screen/main_screen/main_screen.dart';
import 'package:shuttle_9ja/settings/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context),
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthError) {
            MyMessageHandler.showSnackBar(context, state.message);
          }
          if (state is Authenticated) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false);
          }

          if (state is Unathenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => VerifyAccountScreen()));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('You can book any bus to any destination of your choice.'),
                Gap(20),
                Text('Email'),
                Gap(5),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  onChange: () {
                    setState(() {});
                  },
                ),
                Gap(20),
                Text('Password'),
                Gap(5),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  onChange: () {
                    setState(() {});
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      text: "Forgot password?",
                      onPressed: () {},
                    )
                  ],
                ),
                Gap(20),
                CustomButton(
                  enable: emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty,
                  loading: state is Loading,
                  onTap: () {
                    if (!emailController.text.isValidEmail()) {
                      MyMessageHandler.showSnackBar(context, "Invalid Email");
                    }

                    context.read<AuthBlocBloc>().add(
                          SignInEvent(
                            email: emailController.text.trim().toLowerCase(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  title: "Log in",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
