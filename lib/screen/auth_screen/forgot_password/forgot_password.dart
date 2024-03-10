import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textfield.dart';
import 'package:shuttle_9ja/screen/auth_screen/forgot_password/reset_password.dart';
import 'package:shuttle_9ja/settings/validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthError) {
          MyMessageHandler.showSnackBar(context, state.message);
        }
        if (state is AuthSucess) {
          MyMessageHandler.showSnackBar(context, state.message,
              option: options.success, title: "Updated");
          Future.delayed(
              const Duration(
                milliseconds: 400,
              ), () {
            Navigator.pop(context);
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(context, title: "Forgot Password"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  onChange: () {
                    setState(() {});
                  },
                ),
                Gap(30),
                CustomButton(
                  loading: state is Loading,
                  enable: emailController.text.isNotEmpty,
                  onTap: () {
                    if (emailController.text.isValidEmail() == false) {
                      MyMessageHandler.showSnackBar(
                        context,
                        "Invalid Email, Please Enter a valid email",
                      );
                      return;
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ResetPassword()));
                    // context
                    //     .read<AuthBlocBloc>()
                    //     .add(ForgotPasswordEvent(email: emailController.text));
                  },
                  title: "Send OTP",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
