import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../../provider/email.dart';
import '../../../../widgets/custom_button.dart';

class ForgotPWScreen extends StatefulWidget {
  ForgotPWScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPWScreen> createState() => _ForgotPWScreenState();
}

class _ForgotPWScreenState extends State<ForgotPWScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  TextEditingController vcodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
    String? emailvalidation;
  bool validation = false;
  bool visibility = false;
  bool visibility1 = false;
  bool visibility2 = false;


  bool pwsecure = true;
  bool repwsecure = true;
  @override
  void initState() {
    super.initState();
  }

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
              Image.asset(AssetIcons.splash, height: .18.sh, width: .18.sh),
              Column(
                children: <Widget>[
                  Text(
                    "Change Password ",
                    style: TextFontStyle.headline7StyleInter.copyWith(color: AppColors.text80),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    "Dolor sit amet consectetur Lacus \n  convallis sem risus .",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.text40,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Container(
                    width: 30.0,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: AppColors.primeryColor,
                      width: 3.0,
                    ))),
                  ),
                  UIHelper.verticalSpaceMedium,
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //passwords
                    Text(
                      "Current Password",
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      obscureText: !visibility,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
                        suffixIcon: IconButton(
                          color: AppColors.text60,
                          onPressed: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                          icon: Icon(visibility == false
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),

                    UIHelper.verticalSpaceMedium,
                    Text(
                      "New Password",
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      obscureText: !visibility1,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
                        suffixIcon: IconButton(
                          color: AppColors.text60,
                          onPressed: () {
                            setState(() {
                              visibility1 = !visibility1;
                            });
                          },
                          icon: Icon(visibility1 == false
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),

                    UIHelper.verticalSpaceSmall,
                    UIHelper.verticalSpaceSmall,
                    Text(
                      "Confirm Password",
                      style: TextFontStyle.headline12StyleInter.copyWith(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      obscureText: !visibility2,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
                        suffixIcon: IconButton(
                          color: AppColors.text60,
                          onPressed: () {
                            setState(() {
                              visibility2 = !visibility2;
                            });
                          },
                          icon: Icon(visibility2 == false
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,   
              UIHelper.verticalSpaceSmall,
              customeButton(
                name: 'Change',
                height: .065.sh,
                minWidth: double.infinity,
                borderRadius: 5.r,
                color: AppColors.primeryColor,
                textStyle: TextFontStyle.headline4StyleInter
                    .copyWith(color: AppColors.white),
                context: context,
                onCallBack: () async {
                  NavigationService.navigateToReplacement(
                      Routes.naviGationScreen);
                },
              ),
              UIHelper.verticalSpaceLarge,
              UIHelper.verticalSpaceLarge,
              Text(
                "(c) 2022 Codemen. All Rights Reserved.",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    color: AppColors.text40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
