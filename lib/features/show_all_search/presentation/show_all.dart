import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/provider/catpopup_status.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../../../helpers/appbarname_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Leave List", style: TextFontStyle.headline11StyleInter,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: .07.sh,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextFontStyle.headline7StyleInter
                          .copyWith(color: AppColors.appColor9B9B9B),
                      hintText: "Searching...",
                      prefixIcon:
                          Icon(Icons.search, color: AppColors.appColor9B9B9B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                        borderSide: const BorderSide(
                          color: AppColors.disabledColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                        borderSide: const BorderSide(
                          color: AppColors.disabledColor,
                          width: 1,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return  Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.text20)),
                        color: AppColors.text10,
                        elevation: .5,
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
                                      style: TextFontStyle.headline6StyleInter.copyWith(color: Colors.black),
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
                                        backgroundColor: AppColors.text20,
                                        child: Text("02", style: TextStyle(color: AppColors.text80),),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
