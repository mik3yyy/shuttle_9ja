import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:gap/gap.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textfield.dart';
import 'package:shuttle_9ja/screen/auth_screen/verify_email/verify_email.dart';
import 'package:shuttle_9ja/settings/constants.dart';
import 'package:shuttle_9ja/settings/google.dart';
import 'package:shuttle_9ja/settings/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnmeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  List<String> genders = ["Male", "Female"];
  String gender = '';
  TextEditingController controller = TextEditingController();
  String lat = '';
  String long = '';
  bool obscureText = false;
  bool obscureText2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context),
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthError) {
            MyMessageHandler.showSnackBar(context, state.message);
          }
          if (state is Unathenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyAccountScreen(),
              ),
            );
          }
          if (state is AuthBlocInitial) {}
        },
        builder: (context, state) {
          // if (state is Loading) {
          //   return CircularProgressIndicator();
          // }
          return Scrollbar(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign up with your email"),
                    Gap(20),
                    CustomTextField(
                      controller: fnameController,
                      hintText: "First Name",
                      onChange: () {
                        setState(() {});
                      },
                    ),
                    Gap(20),
                    CustomTextField(
                      controller: lnmeController,
                      hintText: "Last Name",
                      onChange: () {
                        setState(() {});
                      },
                    ),
                    Gap(20),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                      onChange: () {
                        setState(() {});
                      },
                    ),
                    Gap(20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Constants.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Constants.grey),
                      ),
                      child: DropDown(
                        isExpanded: true,
                        items: genders,
                        showUnderline: false,
                        hint: Text("Gender"),
                        icon: Icon(
                          Icons.expand_more,
                          color: Constants.black,
                        ),
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                    Gap(20),
                    // GooglePlaceAutoCompleteTextField(
                    //   textEditingController: controller,
                    //   googleAPIKey: Google.apikey,
                    //   inputDecoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.location_on_outlined),
                    //     border: InputBorder.none,
                    //     hintText: "Enter your Location",
                    //     hintStyle: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       // fontSize: 17,
                    //       color: Constants.grey,
                    //     ),
                    //     focusedBorder: InputBorder.none,
                    //   ),
                    //   debounceTime: 800, // default 600 ms,
                    //   countries: const [
                    //     "ng",
                    //   ],
                    //   // optional by default null is set
                    //   isLatLngRequired: true,
                    //   // if you required coordinates from place detail
                    //   getPlaceDetailWithLatLng: (Prediction prediction) {
                    //     // this method will return latlng with place detail
                    //     // print("lng " + prediction.lng.toString());
                    //     // print("lat " + prediction.lat.toString());
                    //     setState(() {
                    //       lat = prediction.lat!;
                    //       long = prediction.lng!;
                    //     });
                    //   }, // this callback is called when isLatLngRequired is true
                    //   itemClick: (Prediction prediction) {
                    //     controller.text = prediction.description!;
                    //     controller.selection = TextSelection.fromPosition(
                    //         TextPosition(offset: prediction.description!.length));
                    //   },
                    //   // if we want to make custom list item builder
                    //   itemBuilder: (context, index, Prediction prediction) {
                    //     return Container(
                    //       padding: EdgeInsets.all(10),
                    //       child: Row(
                    //         children: [
                    //           const Icon(Icons.location_on),
                    //           const SizedBox(
                    //             width: 7,
                    //           ),
                    //           Expanded(child: Text("${prediction.description ?? ""}"))
                    //         ],
                    //       ),
                    //     );
                    //   },
                    //   // if you want to add seperator between list items
                    //   seperatedBuilder: Divider(),
                    //   // want to show close icon
                    //   isCrossBtnShown: true,
                    // ),
                    // Gap(20),

                    CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      suffixIcon: Icon(Icons.visibility),
                      obscureText: false,
                      onChange: () {
                        setState(() {});
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    Gap(20),

                    CustomTextField(
                      controller: cpasswordController,
                      hintText: "Confirm Password",
                      onChange: () {
                        setState(() {});
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Gap(20),
                    IntlPhoneField(
                      // controller: nu,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 17),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          gapPadding: 0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          gapPadding: 0,
                        ),
                        hintText: "Phone Number",
                        hintStyle: Constants.Inter.copyWith(
                          color: Constants.grey,
                          fontSize: 13,
                        ),
                      ),
                      initialCountryCode: 'NG',
                      onChanged: (phone) {
                        setState(() {
                          numberController.text = phone.completeNumber;
                        });
                      },
                    ),
                    Gap(20),
                    CustomButton(
                      loading: state is Loading,
                      enable: fnameController.text.isNotEmpty &&
                          lnmeController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          gender.isNotEmpty &&
                          numberController.text.isNotEmpty &&
                          numberController.text.length > 4 &&
                          passwordController.text.isNotEmpty &&
                          cpasswordController.text.isNotEmpty,
                      onTap: () {
                        if (emailController.text.isValidEmail() == false) {
                          MyMessageHandler.showSnackBar(
                            context,
                            "Invalid Email, Please Enter a valid email",
                          );
                          return;
                        }
                        if (!passwordController.text.validatePassword()) {
                          MyMessageHandler.showSnackBar(
                            context,
                            "password requires capital and small letters, numbers and special characters",
                            title: "Invalid Password",
                          );
                          return;
                        }
                        if (passwordController.text !=
                            cpasswordController.text) {
                          MyMessageHandler.showSnackBar(
                            context,
                            "Password not confirmed correctly",
                          );
                          return;
                        }
                        if (!numberController.text.isValidPhoneNumber()) {
                          MyMessageHandler.showSnackBar(
                            context,
                            "Invalid Phone Number",
                          );
                          return;
                        }
                        context.read<AuthBlocBloc>().add(
                              ReqeustSignup(
                                data: {
                                  'first_name': fnameController.text.trim(),
                                  'last_name': lnmeController.text.trim(),
                                  'email':
                                      emailController.text.trim().toLowerCase(),
                                  'gender': gender,
                                  'password': passwordController.text.trim(),
                                  'phone_number': numberController.text.trim(),
                                },
                              ),
                            );
                      },
                      title: "Sign Up",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
