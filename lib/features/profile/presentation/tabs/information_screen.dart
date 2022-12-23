import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';

import '../../../../helpers/ui_helpers.dart';
import '/constants/app_color.dart';
import '/constants/app_constants.dart';
import '/constants/text_font_style.dart';

import '/networks/api_acess.dart';
import '/widgets/custom_button.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
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
                    // email
                    Text(
                      "Name",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter name",
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
                      "Email",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter email",
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
                      "User Name",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter username",
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
                      "Phone",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter phone';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter phone",
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
                      "Guardian Name",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter name",
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
                      "Guardian Relation",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter relation';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter relation",
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
                      "Guardian Mobile",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter mobile';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter mobile",
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
                      "About",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      maxLines: 5,
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Descibe';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Describe",
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
              UIHelper.verticalSpaceLarge,
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
