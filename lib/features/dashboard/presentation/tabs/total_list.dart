import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
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
                            Text("5633 List"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              UIHelper.verticalSpaceMedium,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.text10,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: AppColors.text10,
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
                                UIHelper.horizontalSpaceSmall,
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints(
                                        maxWidth: .20.sw, maxHeight: .02.sh),
                                    color: Colors.green,
                                    child: Text('ClipRRect',
                                        style: TextFontStyle
                                            .headline11StyleInter
                                            .copyWith(color: AppColors.white)),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceSmall,
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          "START DATE",
                                          style: TextStyle(
                                              color: AppColors.text40),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "12 Dec 12:00PM",
                                      style: TextStyle(color: AppColors.text60),
                                    ),
                                  ],
                                ),
                                UIHelper.horizontalSpaceSmall,
                                Column(
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
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "02",
                                        style:
                                            TextStyle(color: AppColors.text80),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(), //<-- SEE HERE
                                          padding: EdgeInsets.all(10),
                                          backgroundColor: AppColors.text20),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
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
