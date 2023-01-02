import 'package:flutter/material.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/networks/api_acess.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/dateuitl.dart';
import '../../../widgets/loading_indicators.dart';
import '../data/rx_get_leave_type/rx.dart';

class LeavedetailsScreen extends StatefulWidget {
  const LeavedetailsScreen({super.key});

  @override
  State<LeavedetailsScreen> createState() => _LeavedetailsScreenState();
}

class _LeavedetailsScreenState extends State<LeavedetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Leave Details",
          style: TextFontStyle.headline11StyleInter,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            UIHelper.verticalSpaceMedium,
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.text20)),
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: AppColors.white,
                  width: 300.0,
                  child: StreamBuilder(
                      stream: getLeaveDetailReqRXObj.getLeaveDetailStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map data = snapshot.data;
                          Map leaveReq = data["leaveRequest"];

                          return Container(
                            color: AppColors.white,
                            width: 340.0,
                            child: Column(
                              children: <Widget>[
                                // Row(
                                //   children: <Widget>[
                                //     CircleAvatar(
                                //       backgroundImage: AssetImage(
                                //           AssetIcons.userImage),
                                //     ),
                                //     UIHelper.horizontalSpaceSmall,
                                //     Text(
                                //       "Sveltiana",
                                //       style: TextFontStyle
                                //           .headline6StyleInter
                                //           .copyWith(
                                //               color: Colors.black),
                                //     )
                                //   ],
                                // ),
                                UIHelper.verticalSpaceSmall,
                                Row(
                                  children: <Widget>[
                                    Text(
                                        leaveReqRX
                                            .firstWhere((element) =>
                                                element['id'] ==
                                                leaveReq["leave_type_id"])
                                            .entries
                                            .last
                                            .value
                                            .toString(),
                                        style:
                                            TextStyle(color: AppColors.text60)),
                                    UIHelper.horizontalSpaceSmall,
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        constraints: BoxConstraints(
                                            maxWidth: .20.sw,
                                            maxHeight: .02.sh),
                                        color: Colors.green,
                                        child: Text(
                                            // leaveReq[index]['status']
                                            //     ? 'Approved'
                                            //     :
                                            "Pending",
                                            style: TextFontStyle
                                                .headline8StyleInter
                                                .copyWith(
                                                    color: AppColors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpaceSmall,
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      leaveReq["reason"],
                                      style: TextFontStyle.headline6StyleInter
                                          .copyWith(color: AppColors.text40),
                                    )),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(
                                                  "START DATE",
                                                  style: TextFontStyle
                                                      .headline8StyleInter
                                                      .copyWith(
                                                          color:
                                                              AppColors.text40),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              DateFormatedUtils
                                                  .get8601FormatedDate(
                                                      leaveReq['start_date']),
                                              style: TextFontStyle
                                                  .headline6StyleInter
                                                  .copyWith(
                                                      color: AppColors.text60),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.r),
                                          child: Column(
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 25.r,
                                                backgroundColor:
                                                    AppColors.text10,
                                                child: Text(
                                                  leaveReq['half_day'] == 1
                                                      ? "½ day"
                                                      : (DateTime.parse(leaveReq[
                                                                          'end_date'])
                                                                      .difference(
                                                                          DateTime.parse(
                                                                              leaveReq['start_date']))
                                                                      .inDays +
                                                                  1)
                                                              .toString() +
                                                          " Day",
                                                  style: TextStyle(
                                                      color: AppColors.text60),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              "END DATE",
                                              style: TextFontStyle
                                                  .headline8StyleInter
                                                  .copyWith(
                                                      color: AppColors.text40),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          DateFormatedUtils.get8601FormatedDate(
                                              leaveReq['end_date']),
                                          style: TextFontStyle
                                              .headline6StyleInter
                                              .copyWith(
                                                  color: AppColors.text60),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return SizedBox.shrink();
                        }
                        return loadingIndicatorCircle(context: context);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
