import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/widgets/app_drawer.dart';

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
            children: <Widget>[
              Container(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                          border:
                              Border.all(width: 1.0, color: AppColors.text40),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      margin: EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("All"),
                            Text("13,345 Users"),
                            Text("5633 List", style: TextStyle(color: AppColors.text40),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              UIHelper.verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Leave List"),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            NavigationService.navigateTo(Routes.searchScreen);
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                              color: AppColors.primeryColor,
                            ),
                          ),
                        ),
                        Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: AppColors.primeryColor,
                              width: 1.0,
                          ))))
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      NavigationService.navigateTo(Routes.leaveDetailesScreen);
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.text20)),
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
                                      style: TextFontStyle.headline6StyleInter.copyWith(color: Colors.black),
                                    )
                                  ],
                                ),
                                UIHelper.verticalSpaceSmall,
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Casual Leave",
                                      style: TextStyle(color: AppColors.text60)
                                    ),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Text(
                                              "START DATE",
                                              style: TextFontStyle.headline8StyleInter.copyWith(color: AppColors.text40),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "12 Dec 12:00PM",
                                          style: TextFontStyle.headline6StyleInter.copyWith(color: AppColors.text60),
                                        ),
                                      ],
                                    ),
                                    UIHelper.horizontalSpaceSmall,
                                    UIHelper.horizontalSpaceSmall,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "END DATE",
                                          style:TextFontStyle.headline8StyleInter.copyWith(color: AppColors.text40),
                                        ),
                                        Text(
                                          "12 Dec 12:00PM",
                                          style: TextFontStyle.headline6StyleInter.copyWith(color: AppColors.text60),
                                        ),
                                      ],
                                    ),
                                    UIHelper.horizontalSpaceSemiLarge,
                                    Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                        backgroundColor: AppColors.text10,
                                        child: Text("02", style: TextStyle(color: AppColors.text60),),
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
            ],
          ),
        ),
      ),
    );
  }
}
