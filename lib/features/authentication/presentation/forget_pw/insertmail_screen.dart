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
import '../../../../provider/email.dart';
import '../../../../widgets/custom_button.dart';

class InsertEmailScreen extends StatefulWidget {
  const InsertEmailScreen({Key? key}) : super(key: key);

  @override
  State<InsertEmailScreen> createState() => _InsertEmailScreenState();
}

class _InsertEmailScreenState extends State<InsertEmailScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  TextEditingController vcodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool validation = false;
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
              UIHelper.verticalSpaceLarge,
              UIHelper.verticalSpaceLarge,
              Image.asset(AssetIcons.splash, height: .18.sh, width: .18.sh),
              Column(
                children: <Widget>[
                  Text(
                    "Forget Password",
                    style: TextFontStyle.headline5StyleInter,
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
                    // email
                    Text(
                      "Email",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
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
              UIHelper.verticalSpaceSmall,
              customeButton(
                name: 'Send',
                height: .065.sh,
                minWidth: double.infinity,
                borderRadius: 5.r,
                color: AppColors.primeryColor,
                textStyle: TextFontStyle.headline5StyleInter
                    .copyWith(color: AppColors.white),
                context: context,
                onCallBack: () async {
                  NavigationService.navigateToReplacement(
                      Routes.naviGationScreen);
                },
              ),
              UIHelper.verticalSpaceLarge,
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
