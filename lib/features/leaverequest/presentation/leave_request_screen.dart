import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/widgets/app_drawer.dart';
import '../../../helpers/helper.dart';
import '../../../widgets/leave_type_popup_widget.dart';
import '/constants/app_color.dart';
import '/constants/app_constants.dart';
import '/constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';
import '/networks/api_acess.dart';
import '/widgets/custom_button.dart';

class LeaveReqScreen extends StatefulWidget {
  const LeaveReqScreen({Key? key}) : super(key: key);

  @override
  State<LeaveReqScreen> createState() => _LeaveReqScreenState();
}

class _LeaveReqScreenState extends State<LeaveReqScreen> {
  int? _value;
  String radioValue = "";
  DateTime? _dateTime;
  DateTime? _dateTime1;
  int? difference = 0;

  getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));
    setState(() {
      _dateTime = date;
      startDateTimeController.text = date!.toIso8601String();
      difference = _dateTime1!.difference(_dateTime!).inDays;
      log(difference.toString());
    });
  }

  getDate1() async {
    DateTime? date1 = await showDatePicker(
        context: context,
        initialDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));
    setState(() {
      _dateTime1 = date1;
      endDateTimeController.text = date1!.toIso8601String();
      difference = date1.difference(_dateTime!).inDays;
      log(difference.toString());
    });
  }

  TextEditingController leaveTypeController = TextEditingController();
  TextEditingController startDateTimeController = TextEditingController();
  TextEditingController endDateTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController dayOffController = TextEditingController();
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
  void initState() {
    if (!mounted) return;
    setState(() {
      leaveTypeController.text = "-Select-";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Leave Request",
          style: TextFontStyle.headline9StyleInter
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: .05.sw),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UIHelper.verticalSpaceMedium,
                      Text(
                        "Leave Type",
                        style: TextFontStyle.headline12StyleInter
                            .copyWith(color: AppColors.text40),
                      ),
                      UIHelper.verticalSpaceSmall,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        height: 45.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: AppColors.borderColor, width: 0.5)),
                        child: LeaveTypePopupWidget(
                            categorygroupPopupText: leaveTypeController,
                            value: leaveTypeController.text),
                      ),

                      // TextFormField(
                      //   autovalidateMode: validation
                      //       ? AutovalidateMode.always
                      //       : AutovalidateMode.disabled,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Enter name';
                      //     }
                      //     return null;
                      //   },
                      //   keyboardType: TextInputType.emailAddress,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter name",
                      //     hintStyle: TextFontStyle.headline11StyleInter
                      //         .copyWith(color: AppColors.text40),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             width: 1.0, color: AppColors.text20)),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: AppColors.text20)),
                      //   ),
                      // ),

                      UIHelper.verticalSpaceMedium,
                      Text(
                        "Start Date",
                        style: TextFontStyle.headline12StyleInter
                            .copyWith(color: AppColors.text40),
                      ),
                      UIHelper.verticalSpaceSmall,
                      TextFormField(
                        readOnly: true,
                        controller: startDateTimeController,
                        autovalidateMode: validation
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Start Date';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: _dateTime == null
                              ? "00-00-0000"
                              : "${_dateTime?.year} - ${_dateTime?.month} - ${_dateTime?.day}",
                          hintStyle: TextFontStyle.headline11StyleInter
                              .copyWith(color: AppColors.text40),
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
                        style: TextFontStyle.headline12StyleInter
                            .copyWith(color: AppColors.text40),
                      ),
                      UIHelper.verticalSpaceSmall,
                      TextFormField(
                        readOnly: true,
                        controller: endDateTimeController,
                        autovalidateMode: validation
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter End Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: _dateTime1 == null
                              ? "00-00-0000"
                              : "${_dateTime1?.year} - ${_dateTime1?.month} - ${_dateTime1?.day}",
                          hintStyle: TextFontStyle.headline11StyleInter
                              .copyWith(color: AppColors.text40),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_month,
                              color: AppColors.text60,
                            ),
                            onPressed: () async {
                              getDate1();
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
                        style: TextFontStyle.headline12StyleInter
                            .copyWith(color: AppColors.text40),
                      ),
                      UIHelper.verticalSpaceSmall,
                      TextFormField(
                        controller: reasonController,
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
                          hintStyle: TextFontStyle.headline11StyleInter
                              .copyWith(color: AppColors.text40),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0, color: AppColors.text20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.text20)),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      // Text("Day Off", style: TextStyle(color: AppColors.text40),)
                    ],
                  ),
                ),
                UIHelper.verticalSpaceSmall,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: <Widget>[
                //     Radio(value: 1, groupValue: _value, onChanged: (value){
                //       setState(() {
                //         _value = value;
                //       });
                //     }),
                //     Text("Half Day"),
                //     Radio(value: 2, groupValue: _value, onChanged: (value){
                //       setState(() {
                //         _value = value;
                //       });
                //     }),
                //     Text("Full Day"),
                //   ],
                // ),
                if (difference! == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Day Off",
                                style: TextStyle(color: AppColors.text40),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceSmall,
                          Row(
                            children: [
                              Radio(
                                  autofocus: true,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.successColor),
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      dayOffController.text = value.toString();
                                      _value = value;
                                    });
                                  }),
                              Text("Half Day"),
                              UIHelper.horizontalSpaceMedium,
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.successColor),
                                  value: 0,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      dayOffController.text = value.toString();
                                      _value = value;
                                    });
                                  }),
                              Text("Full Day"),
                            ],
                          )
                        ],
                      ),
                      UIHelper.horizontalSpaceMedium,
                    ],
                  ),
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
                    log(leaveTypeController.text);
                    log(startDateTimeController.text);
                    log(endDateTimeController.text);
                    log(reasonController.text);
                    log(dayOffController.text);

                    if (leaveTypeController.text == "-Select-") {
                      const snackBar =
                          SnackBar(content: Text('Select a leave type'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      postLeaveReqRXObj.postLeaveReq(
                          leave_type_id: leaveTypeController.text,
                          start_date: startDateTimeController.text,
                          end_date: endDateTimeController.text,
                          reason: reasonController.text,
                          half_day:
                              difference == 0 ? dayOffController.text : '0');

                      setState(() {
                        validation = true;
                      });
                    } else {
                      const snackBar =
                          SnackBar(content: Text('Fill the field properly'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
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
      ),
    );
  }
}
