import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/widgets/app_drawer.dart';

import '../../../../helpers/all_routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.text20)),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: AppColors.white,
                        width: 145.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.chair),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "Leaves",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "51,855",
                                  style: TextFontStyle.headline10StyleInter
                                      .copyWith(color: AppColors.text80),
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "+55%",
                                  style: TextFontStyle.headline8StyleInter
                                      .copyWith(color: AppColors.primeryColor),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "Outstanding Receivables",
                                  style: TextFontStyle.headline13StyleInter
                                      .copyWith(color: AppColors.text30),
                                ),
                                UIHelper.horizontalSpaceSmall,
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.text20)),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: AppColors.white,
                        width: 145.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.chair),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "Leaves",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "51,855",
                                  style: TextFontStyle.headline10StyleInter
                                      .copyWith(color: AppColors.text80),
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "+55%",
                                  style: TextFontStyle.headline8StyleInter
                                      .copyWith(color: AppColors.primeryColor),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "Outstanding Receivables",
                                  style: TextFontStyle.headline13StyleInter
                                      .copyWith(color: AppColors.text30),
                                ),
                                UIHelper.horizontalSpaceSmall,
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.text20)),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: AppColors.white,
                        width: 145.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.chair),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "Leaves",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "51,855",
                                  style: TextFontStyle.headline10StyleInter
                                      .copyWith(color: AppColors.text80),
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "+55%",
                                  style: TextFontStyle.headline8StyleInter
                                      .copyWith(color: AppColors.primeryColor),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "Outstanding Receivables",
                                  style: TextFontStyle.headline13StyleInter
                                      .copyWith(color: AppColors.text30),
                                ),
                                UIHelper.horizontalSpaceSmall,
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.text20)),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: AppColors.white,
                        width: 145.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.chair),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "Leaves",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "51,855",
                                  style: TextFontStyle.headline10StyleInter
                                      .copyWith(color: AppColors.text80),
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Text(
                                  "+55%",
                                  style: TextFontStyle.headline8StyleInter
                                      .copyWith(color: AppColors.primeryColor),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Text(
                                  "Outstanding Receivables",
                                  style: TextFontStyle.headline13StyleInter
                                      .copyWith(color: AppColors.text30),
                                ),
                                UIHelper.horizontalSpaceSmall,
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notice"),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              NavigationService.navigateTo(Routes.searchScreen);
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(color: AppColors.primeryColor),
                            )),
                        Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: AppColors.primeryColor,
                              width: 1.0,
                            ))))
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
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
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(AssetIcons.userImage),
                                    ),
                                    UIHelper.horizontalSpaceSmall,
                                    Text(
                                      "Sveltiana",
                                      style: TextFontStyle.headline6StyleInter
                                          .copyWith(color: Colors.black),
                                    )
                                  ],
                                ),
                                UIHelper.verticalSpaceSmall,
                                Row(
                                  children: <Widget>[
                                    Text("Casual Leave",
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
                                        child: Text('ClipRRect',
                                            style: TextFontStyle
                                                .headline8StyleInter
                                                .copyWith(
                                                    color: AppColors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpaceSmall,
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
                                              "START DATE",
                                              style: TextFontStyle
                                                  .headline8StyleInter
                                                  .copyWith(
                                                      color: AppColors.text40),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "12 Dec 12:00PM",
                                          style: TextFontStyle
                                              .headline6StyleInter
                                              .copyWith(
                                                  color: AppColors.text60),
                                        ),
                                      ],
                                    ),
                                    UIHelper.horizontalSpaceSmall,
                                    UIHelper.horizontalSpaceSmall,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "END DATE",
                                          style: TextFontStyle
                                              .headline8StyleInter
                                              .copyWith(
                                                  color: AppColors.text40),
                                        ),
                                        Text(
                                          "12 Dec 12:00PM",
                                          style: TextFontStyle
                                              .headline6StyleInter
                                              .copyWith(
                                                  color: AppColors.text60),
                                        ),
                                      ],
                                    ),
                                    UIHelper.horizontalSpaceSemiLarge,
                                    Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: AppColors.text10,
                                          child: Text(
                                            "02",
                                            style: TextStyle(
                                                color: AppColors.text60),
                                          ),
                                        )
                                        // ElevatedButton(
                                        //   onPressed: () {},
                                        //   child: Text(
                                        //     "02",
                                        //     style: TextStyle(
                                        //         color: AppColors.text80),
                                        //   ),
                                        //   style: ElevatedButton.styleFrom(
                                        //       shape:
                                        //           CircleBorder(), //<-- SEE HERE
                                        //       padding: EdgeInsets.all(10),
                                        //       backgroundColor:
                                        //           AppColors.text20),
                                        // ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
