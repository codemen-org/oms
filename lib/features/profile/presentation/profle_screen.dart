import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/navigation_screen.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:plix/widgets/custom_button.dart';
import 'package:plix/widgets/loading_indicators.dart';

import '../../../constants/app_color.dart';
import '../../../helpers/appbarname_helper.dart';
import '../../../widgets/custome_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    appBarName(name: "Profile", context: context);
    super.initState();
  }

  TextEditingController telePhoneEditingController = TextEditingController();
  TextEditingController emailPhoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorFF6F6F6,
      // appBar:
      // AppBar(
      //     backgroundColor: AppColors.primeryColor,
      //     foregroundColor: AppColors.primeryColor,
      //     shadowColor: AppColors.primeryColor,
      //     bottomOpacity: 0.0,
      //     toolbarOpacity: 0.0,
          // leading: AppDrawer(),
      //     elevation: 0.0,
      //     toolbarHeight: .05.sh,
      //     title: Text(
      //       'Profile',
      //       style: TextFontStyle.headline3StyleInter
      //           .copyWith(color: AppColors.appColorFFFFFF),
      //     ),
      //     centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          custome_appbar(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("BIO", style: TextFontStyle.headline14StyleInter.copyWith(color: AppColors.text80),),
              UIHelper.verticalSpace(5),
              Container(
                width: 30.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.primeryColor,
                  width: 3.0,
                ))),
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                "Biodata format is a simple version of the resume. Biodata forms give a summary of your personal details, educational details.",
                style: TextFontStyle.headline15StyleInter
                    .copyWith(color: AppColors.text60),
              ),
              UIHelper.verticalSpaceMedium,
              Text("EMAIL", style: TextFontStyle.headline14StyleInter.copyWith(color: AppColors.text80),),
              UIHelper.verticalSpace(5),
              Container(
                width: 30.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.primeryColor,
                  width: 3.0,
                ))),
              ),
              UIHelper.verticalSpaceSmall,
              Text("test01@test.com",                 style: TextFontStyle.headline15StyleInter
                    .copyWith(color: AppColors.text60),),
              UIHelper.verticalSpaceMedium,
              Text("PHONE", style: TextFontStyle.headline14StyleInter.copyWith(color: AppColors.text80),),
              UIHelper.verticalSpace(5),
              Container(
                width: 30.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.primeryColor,
                  width: 3.0,
                ))),
              ),
              UIHelper.verticalSpaceSmall,
              Text("+880 1671 XXXXXX",                 style: TextFontStyle.headline15StyleInter
                    .copyWith(color: AppColors.text60),),
              UIHelper.verticalSpaceMedium,
              Text("SOCIAL", style: TextFontStyle.headline14StyleInter.copyWith(color: AppColors.text80),),
              UIHelper.verticalSpace(5),
              Container(
                width: 30.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.primeryColor,
                  width: 3.0,
                ))),
              ),
              UIHelper.verticalSpaceSmall,
              Row(
                children: [
                  SvgPicture.asset(AssetIcons.facebook, ),
                  UIHelper.horizontalSpaceSmall,
                  SvgPicture.asset(AssetIcons.twitter),
                  UIHelper.horizontalSpaceSmall,
                  SvgPicture.asset(AssetIcons.linkedin),
                ],
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          NavigationService.navigateTo(Routes.profileEditScreen);
        },
        child: ClipOval(
          child: Container(
            height: 50,
            width: 50,
            color: AppColors.primeryColor,
            child: Icon(
              Icons.edit,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
