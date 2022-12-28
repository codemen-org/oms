import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';

import '../../../../helpers/ui_helpers.dart';
import '../../../../provider/appbar_helper.dart';
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
  ScrollController? scrollController = ScrollController();

  String? emailvalidation;
  bool validation = false;
  bool visibility = false;
  bool isSwitched = false;

  bool pwsecure = true;
    @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController!.addListener(() {
        print('scrolling');
      });

      log(scrollController!.position.isScrollingNotifier.value.toString());

      scrollController!.position.isScrollingNotifier.addListener(() {
        if (!scrollController!.position.isScrollingNotifier.value) {
          if (scrollController!.position.pixels ==
              scrollController!.position.maxScrollExtent) {
            hideAppBarName(context: context, val: true);
            print("for scroll end");
          }
          if (scrollController!.position.pixels ==
              scrollController!.position.minScrollExtent) {
            hideAppBarName(context: context, val: false);
            print("for scroll at top");
          }
          print('scroll is stopped');
        } else {
          if (scrollController!.position.pixels <=
              scrollController!.position.maxScrollExtent / 3) {
            hideAppBarName(context: context, val: true);
          }
          print('scroll is started');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: SingleChildScrollView(
          controller: scrollController,
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
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
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
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
