import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dialog_alert/dialog_alert.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/button_tile.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/screen/auth_screen/overview.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/change_password/change_password.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/Edit_profile/edit_profile.dart';
import 'package:shuttle_9ja/screen/main_screen/profile/upload_photo.dart';
import 'package:shuttle_9ja/settings/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({key});
  static String id = '/profil';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  String _imageFile = '';
  void _pickImageFromGallery() async {
    try {
      final pickedImage = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      if (pickedImage!.path != null) {
        setState(() {
          _imageFile = pickedImage.path;
        });
        showModalBottomSheet(
          context: context,
          builder: (_) => UplaodPhotScreen(
            file: File(_imageFile),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      MyMessageHandler.showSnackBar(context, "Invalid Image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle()),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Constants.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.network(
                        Constants.profile,
                        width: 137,
                        height: 137,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        onPressed: () {
                          _pickImageFromGallery();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            ButtonTile(
              title: "Edit Profile",
              leading: Icon(Icons.edit),
              traling: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen()));
              },
            ),

            ButtonTile(
              title: "Change Password",
              leading: Icon(Icons.lock),
              traling: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChnagePassword()));
              },
            ),

            ButtonTile(
              title: "Contact us",
              leading: Icon(Icons.headset_mic_sharp),
              traling: Icon(Icons.chevron_right),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ContactUs()));
              },
            ),

            ButtonTile(
              title: "Terms and Conditions",
              leading: const Icon(Icons.book),

              // traling: Icon(Icons.book),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationName: "Shuttle 9JA",
                    applicationVersion: "1.0.0",
                    applicationIcon: Image.asset(
                      "assets/images/splash.png",
                      width: 100,
                      height: 100,
                    ),
                    children: [
                      const Text(
                        '1. Acceptance of Terms: By downloading, accessing, or using the Study Stats mobile application Study Stats, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, you may not use the App.' +
                            "\n2. Use of the App: Study Stats is intended solely for personal, non-commercial use. You may use the App to track your academic performance and set goals related to your GPA.",
                      )
                    ]);
              },
            ),
            // ButtonTile(
            //   title: "Dark Mode",
            //   leading: Icon(Icons.dark_mode),
            //   traling: IconButton(
            //     onPressed: () {
            //       mainProvider.changeTheme();
            //     },
            //     icon: mainProvider.isLight()
            //         ? Icon(Icons.toggle_off)
            //         : Icon(Icons.toggle_on_outlined),
            //   ),
            //   onTap: () {},
            // ),
            ButtonTile(
              title: "Log Out",
              leading: Icon(
                Icons.logout,
                color: Constants.white,
              ),
              color: Theme.of(context).colorScheme.primary,
              // traling: Icon(Icons.chevron_right),
              onTap: () async {
                final result = await showDialogAlert(
                  context: context,
                  title: 'Are you sure?',
                  message: 'Do you want to Log Out?',
                  actionButtonTitle: 'Log out',
                  cancelButtonTitle: 'Cancel',
                  actionButtonTextStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  cancelButtonTextStyle: const TextStyle(
                    color: Colors.black,
                  ),
                );

                if (result == ButtonActionType.action) {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, SignInScreen.id, (route) => false);
                  // authProvider.clearData();
                  // NotificationFunction.cancelAllNotifications();

                  // ProfileFunction.LogOut(context);
                  context.read<AuthBlocBloc>().add(SignOutEvent());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => OverviewScreen()),
                      (route) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
