import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/helpers/helper.dart';
import '../../../../helpers/ui_helpers.dart';
import '/constants/app_color.dart';
import '/constants/text_font_style.dart';
import '/widgets/custom_button.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                          return 'Enter Description';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Describe",
                        hintStyle: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text40),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                width: 1.0, color: AppColors.text20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.text20)),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Row(
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            "Account Statues:",
                            style: TextStyle(color: AppColors.text40),
                          ),
                          onPressed: () {},
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: toogleSwitch,
                          activeColor: AppColors.primeryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
