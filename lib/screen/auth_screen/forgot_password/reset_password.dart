import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textfield.dart';
import 'package:shuttle_9ja/settings/constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _otpController = TextEditingController();
  bool obscuretext = true;
  final TextEditingController _NpasswordController = TextEditingController();
  bool obscuretext2 = true;
  final TextEditingController _CpasswordController = TextEditingController();
  bool obscuretext3 = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) async {
        if (state is AuthError) {
          MyMessageHandler.showSnackBar(context, state.message);
        }
        if (state is AuthSucess) {
          MyMessageHandler.showSnackBar(context, state.message,
              option: options.success);
          await Future.delayed(Duration(microseconds: 400), () {
            Navigator.pop(context);
          });
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(context, title: "Reset password"),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Token",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constants.black,
                  ),
                ),
                Constants.gap(height: 5),
                CustomTextField(
                  controller: _otpController,
                  obscureText: obscuretext,
                  hintText: "Enter OTP",
                  onChange: () {
                    setState(() {});
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscuretext = !obscuretext;
                      });
                    },
                    icon: obscuretext
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                ),
                Constants.gap(height: 20),
                Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constants.black,
                  ),
                ),
                Constants.gap(height: 5),
                CustomTextField(
                  controller: _NpasswordController,
                  obscureText: obscuretext2,
                  hintText: "Enter Password",
                  onChange: () {
                    setState(() {});
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscuretext2 = !obscuretext2;
                      });
                    },
                    icon: obscuretext
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                ),
                Constants.gap(height: 20),
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constants.black,
                  ),
                ),
                Constants.gap(height: 5),
                CustomTextField(
                  controller: _CpasswordController,
                  obscureText: obscuretext3,
                  hintText: "Enter Password",
                  onChange: () {
                    setState(() {});
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscuretext3 = !obscuretext3;
                      });
                    },
                    icon: obscuretext
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                ),
                Constants.gap(height: 20),
                CustomButton(
                  loading: state is Loading,
                  enable: _otpController.text.isNotEmpty &&
                      _NpasswordController.text.isNotEmpty &&
                      _CpasswordController.text.isNotEmpty,
                  onTap: () async {
                    context.read<AuthBlocBloc>().add(ResetPasswordEvent(
                          otp: _otpController.text.trim(),
                          password: _NpasswordController.text.trim(),
                          confirmPassword: _CpasswordController.text.trim(),
                        ));
                  },
                  title: "Change Password",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
