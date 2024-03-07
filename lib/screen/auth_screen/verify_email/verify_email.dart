import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';

import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textbutton.dart';
import 'package:shuttle_9ja/screen/auth_screen/login_screen/login_screen.dart';
import 'package:shuttle_9ja/settings/constants.dart';

import 'package:flutter/services.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  bool loading = false;
  bool enable = false;
  FocusNode focusNode = FocusNode();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ScaffoldMessenger(
          key: scaffoldKey,
          child: Scaffold(
            appBar: DefaultAppBar(context),
            body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
              listener: (context, state) {
                if (state is AuthBlocInitial) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
                if (state is AuthError) {
                  MyMessageHandler.showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Verify your account",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Gap(25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Text(
                              "We have sent an OTP to your email. Kindly input the pin below",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Opacity(
                              opacity: 0,
                              child: TextField(
                                focusNode: focusNode,
                                controller: codeController,
                                keyboardType: TextInputType.number,
                                maxLength: 5,
                                onChanged: (valu) {
                                  if (valu.length > 3) {
                                    setState(() {
                                      enable = true;
                                    });
                                  } else {
                                    setState(() {
                                      enable = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Constants.gap(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OTPView(
                                text: codeController.text.length > 0
                                    ? codeController.text[0]
                                    : "",
                                onTap: () => focusNode.hasFocus
                                    ? focusNode.unfocus()
                                    : focusNode.requestFocus(),
                              ),
                              OTPView(
                                text: codeController.text.length > 1
                                    ? codeController.text[1]
                                    : "",
                                onTap: () => focusNode.hasFocus
                                    ? focusNode.unfocus()
                                    : focusNode.requestFocus(),
                              ),
                              OTPView(
                                text: codeController.text.length > 2
                                    ? codeController.text[2]
                                    : "",
                                onTap: () => focusNode.hasFocus
                                    ? focusNode.unfocus()
                                    : focusNode.requestFocus(),
                              ),
                              OTPView(
                                text: codeController.text.length > 3
                                    ? codeController.text[3]
                                    : "",
                                onTap: () => focusNode.hasFocus
                                    ? focusNode.unfocus()
                                    : focusNode.requestFocus(),
                              ),
                              OTPView(
                                text: codeController.text.length > 4
                                    ? codeController.text[4]
                                    : "",
                                onTap: () => focusNode.hasFocus
                                    ? focusNode.unfocus()
                                    : focusNode.requestFocus(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Didn't receive OTP? "),
                              CustomTextButton(
                                text: "Resend",
                                onPressed: () {
                                  if (state is Unathenticated) {
                                    context.read<AuthBlocBloc>().add(
                                          ResendOTPEvent(
                                              email: state.email,
                                              password: state.password),
                                        );
                                  }
                                },
                              ),
                            ],
                          ),
                          Constants.gap(height: 25),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            bottomNavigationBar: Container(
              height: 100,
              child: CustomButton(
                loading: state is Loading,
                onTap: () async {
                  setState(() {
                    focusNode.unfocus();
                  });

                  context.read<AuthBlocBloc>().add(
                        ReqeustVerify(
                          pin: codeController.text.trim(),
                        ),
                      );
                },
                title: "Verify",
                enable: enable,
              ),
            ),
          ),
        );
      },
    );
  }
}

class OTPView extends StatefulWidget {
  const OTPView({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Constants.black)),
        child: Center(
          child: Text(widget.text),
        ),
      ),
    );
  }
}
