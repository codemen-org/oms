import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/app_constants.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class custome_card extends StatelessWidget {
  const custome_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    backgroundImage: AssetImage(AssetIcons.userImage),
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
                      style: TextStyle(color: AppColors.text60)),
                  UIHelper.horizontalSpaceSmall,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      alignment: Alignment.center,
                      constraints:
                          BoxConstraints(maxWidth: .20.sw, maxHeight: .02.sh),
                      color: Colors.green,
                      child: Text('ClipRRect',
                          style: TextFontStyle.headline8StyleInter
                              .copyWith(color: AppColors.white)),
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
                            style: TextFontStyle.headline8StyleInter
                                .copyWith(color: AppColors.text40),
                          ),
                        ],
                      ),
                      Text(
                        "12 Dec 12:00PM",
                        style: TextFontStyle.headline6StyleInter
                            .copyWith(color: AppColors.text60),
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
                        style: TextFontStyle.headline8StyleInter
                            .copyWith(color: AppColors.text40),
                      ),
                      Text(
                        "12 Dec 12:00PM",
                        style: TextFontStyle.headline6StyleInter
                            .copyWith(color: AppColors.text60),
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
                          style: TextStyle(color: AppColors.text60),
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
    );
  }
}
