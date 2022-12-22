import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/widgets/app_drawer.dart';
import '../../../../helpers/helper.dart';
import '/constants/app_color.dart';
import '/constants/app_constants.dart';
import '/constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '/networks/api_acess.dart';
import '/widgets/custom_button.dart';

class LeaveReqScreen extends StatefulWidget {
  const LeaveReqScreen({Key? key}) : super(key: key);

  @override
  State<LeaveReqScreen> createState() => _LeaveReqScreenState();
}

class _LeaveReqScreenState extends State<LeaveReqScreen> {

  String radioValue = "";
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;

  getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));
    setState(() {
      _dateTime = date;
    });
  }

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Leave Request"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: .05.sw),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0, color: AppColors.text20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.text20)),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        "Leave Type",
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
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0, color: AppColors.text20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.text20)),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        "Start Date",
                        style: TextStyle(color: AppColors.text40),
                      ),
                      UIHelper.verticalSpaceSmall,
                      TextFormField(
                        autovalidateMode: validation
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter date';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: _dateTime == null
                              ? "00-00-0000"
                              : "Date : ${_dateTime?.year} - ${_dateTime?.month} - ${_dateTime?.day}",
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_month,
                              color: AppColors.text60,
                            ),
                            onPressed: () async {
                              getDate();
                            },
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
                        "End Date",
                        style: TextStyle(color: AppColors.text40),
                      ),
                      UIHelper.verticalSpaceSmall,
                      TextFormField(
                        autovalidateMode: validation
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter date';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: _dateTime == null
                              ? "00-00-0000"
                              : "Date : ${_dateTime?.year} - ${_dateTime?.month} - ${_dateTime?.day}",
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_month,
                              color: AppColors.text60,
                            ),
                            onPressed: () async {
                              getDate();
                            },
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
                        "Reason",
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
                            return 'Enter reason';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Describe",
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
                UIHelper.verticalSpaceSmall,
                Row(
                  children: <Widget>[
                  ],
                ),
                UIHelper.verticalSpaceSmall,
                UIHelper.verticalSpaceSmall,
                customeButton(
                  name: 'Request',
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
      ),
    );
  }
}
