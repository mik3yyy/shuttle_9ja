import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/appbar.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textfield.dart';
import 'package:shuttle_9ja/settings/constants.dart';
import 'package:shuttle_9ja/settings/validators.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = context.read<AuthBlocBloc>().state;
    if (data is Authenticated) {
      fnameController.text = data.user.firstName;
      lnmeController.text = data.user.lastName;
      emailController.text = data.user.email;
      gender = data.user.gender;
      controller.text = data.user.phoneNumber.substring(4);
      numberController.text = data.user.phoneNumber;
      // passwordController.text = mike.user.p;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {
        print(state);

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
        // if (state is Unathenticated) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => VerifyAccountScreen(),
        //     ),
        //   );
        // }
        // if (state is AuthBlocInitial) {}
      },
      builder: (context, state) {
        // if (state is Loading) {
        //   return CircularProgressIndicator();
        // }
        return Scaffold(
          appBar: DefaultAppBar(
            context,
            title: "Edit Profile",
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Sign up with your email"),
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
                    // CustomTextField(
                    //   controller: emailController,
                    //   hintText: "Email",
                    //   onChange: () {
                    //     setState(() {});
                    //   },
                    // ),
                    // Gap(20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Constants.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Constants.grey),
                      ),
                      child: DropDown(
                        initialValue: gender,
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

                    IntlPhoneField(
                      // controller: numberController,
                      initialValue: controller.text,
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
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100,
            child: CustomButton(
              loading: state is Loading,
              enable: fnameController.text.isNotEmpty &&
                  lnmeController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  gender.isNotEmpty &&
                  numberController.text.isNotEmpty &&
                  numberController.text.length > 4,
              onTap: () {
                if (emailController.text.isValidEmail() == false) {
                  MyMessageHandler.showSnackBar(
                    context,
                    "Invalid Email, Please Enter a valid email",
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
                if (state is Authenticated) {
                  context.read<AuthBlocBloc>().add(
                        ReqeustUpdateProfile(
                          data: {
                            'first_name': fnameController.text.trim(),
                            'last_name': lnmeController.text.trim(),
                            'email': emailController.text.trim().toLowerCase(),
                            'gender': gender,
                            'phone_number': numberController.text.trim(),
                          },
                          token: state.token,
                        ),
                      );
                }
              },
              title: "Edit Profile",
            ),
          ),
        );
      },
    );
  }
}
