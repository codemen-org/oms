// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../networks/api_acess.dart';
import 'loading_indicators.dart';

class LeaveTypePopupWidget extends StatefulWidget {
  LeaveTypePopupWidget(
      {Key? key, required this.categorygroupPopupText, required this.value})
      : super(key: key);

  final TextEditingController categorygroupPopupText;
  String value;

  @override
  State<LeaveTypePopupWidget> createState() => _LeaveTypePopupWidgetState();
}

class _LeaveTypePopupWidgetState extends State<LeaveTypePopupWidget> {
  final _popUpGlobalkey = GlobalKey<PopupMenuButtonState<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _popUpGlobalkey.currentState!.showButtonMenu();
      },
      child: StreamBuilder(
        stream: getLeaveTypeReqRXObj.getLeaveTypeStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = snapshot.data["leave_types"];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.value,
                  style: TextFontStyle.headline12StyleInter
                      .copyWith(color: AppColors.text40),
                ),
                PopupMenuButton<Map>(
                  key: _popUpGlobalkey,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                  ),
                  iconSize: 25.r,
                  onSelected: (Map val) {
                    setState(() {
                      String leaveTypeId = val["id"];
                      widget.value = val["name"];
                      widget.categorygroupPopupText.text = val["id"];
                      log("The id is ${leaveTypeId}");
                    });
                  },
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  // position: PopupMenuPosition.over,
                  offset: const Offset(-220, 0),
                  itemBuilder: (context) => List.generate(
                    growable: true,
                    data.length,
                    (index) => PopupMenuItem(
                      value: {
                        "id": data[index]["id"],
                        "name": data[index]["title"]
                      },
                      child: Text(
                        data[index]["title"],
                        style: TextFontStyle.headline10StyleInter
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: loadingIndicatorCircle(context: context),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
