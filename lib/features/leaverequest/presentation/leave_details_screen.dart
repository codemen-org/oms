import 'package:flutter/material.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/widgets/app_drawer.dart';

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
        title: Text("Leave Details", style: TextFontStyle.headline11StyleInter,),
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
              color: AppColors.text10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: AppColors.text10,
                  width: 300.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(AssetIcons.userImage),
                          ),
                          UIHelper.horizontalSpaceMedium,
                          Text(
                            "Sveltiana",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceSmall,
                      Row(
                        children: <Widget>[
                          Text(
                            "Casual Leave",
                            style: TextStyle(color: AppColors.text60),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceMedium,
                      Row(
                        children: <Widget>[
                          Text(
                            "LEAVE REASON",
                            style: TextStyle(color: AppColors.text40),
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceSmall,
                      Row(
                        children: <Widget>[
                          Text(
                            "Biodata format is a simple version of the \n resume. Biodata forms give a summary of \n your personal details. Biodata format is a \n simple version of the resume. Biodata forms \n give a summary of your personal details.",
                            style: TextStyle(color: AppColors.text60),
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceMedium,
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
                                    style: TextStyle(color: AppColors.text40),
                                  ),
                                ],
                              ),
                              Text(
                                "12 Dec 12:00PM",
                                style: TextStyle(color: AppColors.text60),
                              ),
                            ],
                          ),
                          UIHelper.horizontalSpaceMedium,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "END DATE",
                                style: TextStyle(color: AppColors.text40),
                              ),
                              Text(
                                "12 Dec 12:00PM",
                                style: TextStyle(color: AppColors.text60),
                              ),
                            ],
                          ),
                          UIHelper.horizontalSpaceMedium,
                          UIHelper.horizontalSpaceSmall,
                          UIHelper.horizontalSpaceSmall,
                          UIHelper.horizontalSpaceSmall,
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: AppColors.text20,
                                child: Text(
                                  "02",
                                  style: TextStyle(color: AppColors.text80),
                                ),
                              )
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     "00",
                              //     style: TextStyle(color: AppColors.text80),
                              //   ),
                              //   style: ElevatedButton.styleFrom(
                              //       shape: CircleBorder(), //<-- SEE HERE
                              //       padding: EdgeInsets.all(10),
                              //       backgroundColor: AppColors.text20),
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
          ],
        ),
      ),
    );
  }
}
