import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:plix/widgets/loading_indicators.dart';

import '../../../../helpers/dateuitl.dart';
import '../../../../networks/api_acess.dart';
import '../../../leaverequest/data/rx_get_leave_type/rx.dart';

class LeaveListScreen extends StatefulWidget {
  const LeaveListScreen({super.key});

  @override
  State<LeaveListScreen> createState() => _LeaveListScreenState();
}

class _LeaveListScreenState extends State<LeaveListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 140,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(width: 1.0, color: AppColors.text40),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Leave Count"),
                      Text(getLeaveDBRXObj.getLeaveDBStream.value["taken_leave"]
                          .toString()),
                      Text(
                        "20 Allowed",
                        style: TextStyle(color: AppColors.text40),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 120,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 1,
              //     itemBuilder: (context, index) {
              //       return
              //     },
              //   ),
              // ),
              UIHelper.verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Leave List"),
                    // Column(
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         NavigationService.navigateTo(Routes.searchScreen);
                    //       },
                    //       child: Text(
                    //         "View All",
                    //         style: TextStyle(
                    //           color: AppColors.primeryColor,
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //         width: 50.0,
                    //         decoration: BoxDecoration(
                    //             border: Border(
                    //                 bottom: BorderSide(
                    //           color: AppColors.primeryColor,
                    //           width: 1.0,
                    //         ))))
                    //   ],
                    // )
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,
              StreamBuilder(
                  stream: getLeaveReqListRXObj.getLeaveReqListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map data = snapshot.data;
                      List leaveReq = data["leaveRequest"];
                      if (leaveReq.length != 0) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: leaveReq.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await getLeaveDetailReqRXObj
                                    .fetchLeavaveDetailReq(
                                        leaveReq[index]['id']);
                                NavigationService.navigateTo(
                                    Routes.leaveDetailesScreen);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: AppColors.text20)),
                                color: AppColors.white,
                                elevation: .5,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
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
                                                        leaveReq[index]
                                                            ["leave_type_id"])
                                                    .entries
                                                    .last
                                                    .value
                                                    .toString(),
                                                style: TextStyle(
                                                    color: AppColors.text60)),
                                            UIHelper.horizontalSpaceSmall,
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                                                            color: AppColors
                                                                .white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        UIHelper.verticalSpaceSmall,
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              leaveReq[index]["reason"],
                                              maxLines: 1,
                                              style: TextFontStyle
                                                  .headline6StyleInter
                                                  .copyWith(
                                                      color: AppColors.text40),
                                            )),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                                  color: AppColors
                                                                      .text40),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      DateFormatedUtils
                                                          .get8601FormatedDate(
                                                              leaveReq[index][
                                                                  'start_date']),
                                                      style: TextFontStyle
                                                          .headline6StyleInter
                                                          .copyWith(
                                                              color: AppColors
                                                                  .text60),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.r),
                                                  child: Column(
                                                    children: <Widget>[
                                                      CircleAvatar(
                                                        radius: 25.r,
                                                        backgroundColor:
                                                            AppColors.text10,
                                                        child: Text(
                                                          leaveReq[index][
                                                                      'half_day'] ==
                                                                  1
                                                              ? "½ day"
                                                              : (DateTime.parse(leaveReq[index]['end_date'])
                                                                              .difference(DateTime.parse(leaveReq[index]['start_date']))
                                                                              .inDays +
                                                                          1)
                                                                      .toString() +
                                                                  " Day",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .text60),
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
                                                              color: AppColors
                                                                  .text40),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  DateFormatedUtils
                                                      .get8601FormatedDate(
                                                          leaveReq[index]
                                                              ['end_date']),
                                                  style: TextFontStyle
                                                      .headline6StyleInter
                                                      .copyWith(
                                                          color:
                                                              AppColors.text60),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                            child: Text("No leave request available"));
                      }
                    } else if (snapshot.hasError) {
                      return SizedBox.shrink();
                    }
                    return loadingIndicatorCircle(context: context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
