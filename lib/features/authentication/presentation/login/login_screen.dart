import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import '../../../../helpers/helper.dart';
import '/constants/app_color.dart';
import '/constants/app_constants.dart';
import '/constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '/networks/api_acess.dart';
import '/widgets/custom_button.dart';

class LogeinScreen extends StatefulWidget {
  const LogeinScreen({Key? key}) : super(key: key);

  @override
  State<LogeinScreen> createState() => _LogeinScreenState();
}

class _LogeinScreenState extends State<LogeinScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? emailvalidation;
  bool validation = false;
  bool visibility = false;
  bool isSwitched = false;

  void toogleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

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
              Image.asset(AssetIcons.splash, height: .18.sh, width: .18.sh),
              Column(
                children: <Widget>[
                  Text(
                    "Sign In",
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
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                      controller: emailController,
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

                    //passwords
                    Text(
                      "Password",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    UIHelper.verticalSpaceSmall,
                    TextFormField(
                      autovalidateMode: validation
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: !visibility,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
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
                  ],
                ),
              ),
              UIHelper.verticalSpaceSemiLarge,
              Row(
                children: <Widget>[
                  Switch(
                    value: isSwitched,
                    onChanged: toogleSwitch,
                    activeColor: AppColors.primeryColor,
                  ),
                  TextButton(
                    child: Text(
                      "Remember Me",
                      style: TextStyle(color: AppColors.text40),
                    ),
                    onPressed: () {},
                  ),
                  UIHelper.horizontalSpaceSemiLarge,
                  Spacer(),
                  TextButton(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: AppColors.text40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      NavigationService.navigateTo(
                        Routes.emailEntryScreen,
                      );
                    },
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              UIHelper.verticalSpaceSmall,
              customeButton(
                name: 'Sign In',
                height: .065.sh,
                minWidth: double.infinity,
                borderRadius: 5.r,
                color: AppColors.primeryColor,
                textStyle: TextFontStyle.headline5StyleInter
                    .copyWith(color: AppColors.white),
                context: context,
                onCallBack: () async {
                  if (_formKey.currentState!.validate()) {
                    setId();
                    await getLoginRXObj.login(
                        emailController.text, passwordController.text);

                    // setState(() {
                    //   validation = true;
                    // });
                  } else {
                    const snackBar = SnackBar(
                        content: Text('Email or Password is not valid'));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
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
