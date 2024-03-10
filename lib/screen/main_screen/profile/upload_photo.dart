import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shuttle_9ja/bloc/auth_bloc_bloc.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/mymessage_handler.dart';
import 'package:shuttle_9ja/global_widget/textbutton.dart';

class UplaodPhotScreen extends StatefulWidget {
  const UplaodPhotScreen({super.key, required this.file});
  final File file;
  @override
  State<UplaodPhotScreen> createState() => _UplaodPhotScreenState();
}

class _UplaodPhotScreenState extends State<UplaodPhotScreen> {
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
            appBar: AppBar(
              leading: Container(),
              actions: [
                CustomTextButton(text: "Cancel", onPressed: () {}),
                Gap(20)
              ],
            ),
            body: Column(
              children: [
                Row(),
                Expanded(
                  child: Image.file(
                    widget.file,
                  ),
                ),
                // Gap(10),
              ],
            ),
            bottomNavigationBar: Container(
              height: 100,
              child: CustomButton(
                onTap: () {
                  context
                      .read<AuthBlocBloc>()
                      .add(UploadPhoto(file: widget.file));
                },
                title: "Upload Photo",
              ),
            ));
      },
    );
  }
}
