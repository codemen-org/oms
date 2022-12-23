import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../helpers/ui_helpers.dart';
import '/constants/app_color.dart';
import '/constants/text_font_style.dart';

import '/widgets/custom_button.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? emailvalidation;
  bool validation = false;
  bool visibility = false;
  bool isSwitched = false;

  bool pwsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpaceSemiLarge,
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Facebook",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Facebook ID';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Url:",
                        hintStyle: TextStyle(color: AppColors.text40),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text(
                      "Twitter",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter twit account';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Url:",
                        hintStyle: TextStyle(color: AppColors.text40),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text(
                      "Github",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter git account';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Url:",
                        hintStyle: TextStyle(color: AppColors.text40),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium,
              UIHelper.verticalSpaceSmall,
              customeButton(
                name: 'Update',
                height: .065.sh,
                minWidth: double.infinity,
                borderRadius: 5.r,
                color: AppColors.primeryColor,
                textStyle: TextFontStyle.headline5StyleInter
                    .copyWith(color: AppColors.white),
                context: context,
                onCallBack: () async {},
              ),
              // Text(
              //   "(c) 2022 Codemen. All Rights Reserved.",
              //   style: TextStyle(
              //       fontSize: 12.0,
              //       fontWeight: FontWeight.w300,
              //       color: AppColors.text40),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
