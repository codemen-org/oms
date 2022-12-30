import 'package:flutter/material.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/dateuitl.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/widgets/loading_indicators.dart';

import '../../../networks/api_acess.dart';

class NoticedetailsScreen extends StatefulWidget {
  const NoticedetailsScreen({super.key});

  @override
  State<NoticedetailsScreen> createState() => _NoticedetailsScreenState();
}

class _NoticedetailsScreenState extends State<NoticedetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Notice Details",
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
                      stream: getNoticeDetailRXObj.getNoticeDetailStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Map data = snapshot.data;
                          return Column(
                            children: <Widget>[
                              // Row(
                              //   children: <Widget>[
                              //     CircleAvatar(
                              //       backgroundImage: AssetImage(AssetIcons.userImage),
                              //     ),
                              //     UIHelper.horizontalSpaceMedium,
                              //     Text(
                              //       "Sveltiana",
                              //       style: TextFontStyle.headline6StyleInter
                              //           .copyWith(color: Colors.black),
                              //     )
                              //   ],
                              // ),
                              // UIHelper.verticalSpaceSmall,
                              // Row(
                              //   children: <Widget>[
                              //     Text(
                              //       "Casual Leave",
                              //       style: TextStyle(color: AppColors.text60),
                              //     ),
                              //     UIHelper.horizontalSpaceSmall,
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.circular(30.0),
                              //       child: Container(
                              //         alignment: Alignment.center,
                              //         constraints: BoxConstraints(
                              //             maxWidth: .20.sw, maxHeight: .02.sh),
                              //         color: Colors.red,
                              //         child: Text('REJECTED',
                              //             style: TextFontStyle.headline8StyleInter
                              //                 .copyWith(color: AppColors.white)),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // UIHelper.verticalSpaceMedium,
                              Row(
                                children: <Widget>[
                                  Text(
                                    data['notices']['notice_title'],
                                    style: TextFontStyle.headline6StyleInter
                                        .copyWith(color: AppColors.text100),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    data['notices']['notice_description'],
                                    style: TextFontStyle.headline15StyleInter
                                        .copyWith(color: AppColors.text80),
                                  )
                                ],
                              ),
                              UIHelper.verticalSpaceMedium,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Text(
                                            "Notice Date",
                                            style: TextFontStyle
                                                .headline16StyleInter
                                                .copyWith(
                                                    color: AppColors.text30),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        DateFormatedUtils.get8601FormatedDate(
                                            data['notices']['notice_date']),
                                        style:
                                            TextStyle(color: AppColors.text60),
                                      ),
                                    ],
                                  ),
                                  UIHelper.horizontalSpaceMedium,
                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: <Widget>[
                                  //     Text(
                                  //       "END DATE",
                                  //       style: TextFontStyle.headline16StyleInter
                                  //           .copyWith(color: AppColors.text30),
                                  //     ),
                                  //     Text(
                                  //       "12 Dec 12:00PM",
                                  //       style: TextStyle(color: AppColors.text60),
                                  //     ),
                                  //   ],
                                  // ),
                                  // UIHelper.horizontalSpaceMedium,
                                  // UIHelper.horizontalSpaceSmall,
                                  // UIHelper.horizontalSpaceSmall,
                                  // Column(
                                  //   children: <Widget>[
                                  //     CircleAvatar(
                                  //       backgroundColor: AppColors.text10,
                                  //       child: Text(
                                  //         "00",
                                  //         style: TextStyle(color: AppColors.text60),
                                  //       ),
                                  //     )
                                  //     // ElevatedButton(
                                  //     //   onPressed: () {},
                                  //     //   child: Text(
                                  //     //     "00",
                                  //     //     style: TextStyle(color: AppColors.text80),
                                  //     //   ),
                                  //     //   style: ElevatedButton.styleFrom(
                                  //     //       shape: CircleBorder(), //<-- SEE HERE
                                  //     //       padding: EdgeInsets.all(10),
                                  //     //       backgroundColor: AppColors.text20),
                                  //     // ),
                                  //   ],
                                  // ),
                                ],
                              )
                            ],
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
