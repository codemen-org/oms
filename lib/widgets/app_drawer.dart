import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plix/features/dashboard/presentation/home_screen.dart';
import 'package:plix/helpers/url_lunch.dart';
import 'package:plix/widgets/draw_tile_widget.dart';

import '../constants/app_color.dart';
import '../constants/app_constants.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';
import '../networks/api_acess.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetIcons.splash,
                    width: 149.0,
                     scale: 2,
                  ),
                  UIHelper.horizontalSpaceLarge,
                  UIHelper.horizontalSpaceMedium,
                  UIHelper.horizontalSpaceSmall,
                  UIHelper.horizontalSpaceSmall,
                  UIHelper.horizontalSpaceSmall,
                   IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        CupertinoIcons.clear_circled,
                        color: AppColors.primeryColor,
                        size: 40.sp,
                      )),
                ],
              ),
          ),
          UIHelper.verticalSpaceSemiLarge,                 
          DrawerTileWidget(
            icon: AssetIcons.dashboard,
            title: 'Dashboard',
            onTap: () {
              // Navigator.pushNamed(context, Route.navigation,
              //     arguments: const HomeScreen());
            },
          ),
          Container(
            height: 1.h,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.user,
            title: 'Profile',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const SobrenosScreen());
            },
          ),
          Container(
            height: 1.h,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.hrm,
            title: 'HRM',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ContestarScreen());
            },
          ),
          Container(
            height: 1.h,
            width: double.infinity,
          ),
          // DrawerTileWidget(
          //   icon: AssetIcons.notice,
          //   title: 'Notice',
          //   onTap: () {
          //     // Navigator.pushNamed(context, Routes.navigation,
          //     //     arguments: const PublicationScreen());
          //   },
          // ),
          // Container(
          //   height: 1.h,
          //   width: double.infinity,
          // ),
          // DrawerTileWidget(
          //   icon: AssetIcons.event,
          //   title: 'Event',
          //   onTap: () {
          //     // Navigator.pushNamed(context, Routes.navigation,
          //     //     arguments: const FaqsScreen());
          //   },
          // ),
          // Container(
          //   height: 1.h,
          //   width: double.infinity,
          // ),
          // DrawerTileWidget(
          //   icon: AssetIcons.contact,
          //   title: 'Contact',
          //   onTap: () {
          //     // Navigator.pushNamed(context, Routes.navigation,
          //     //     arguments: const ServiceScreen());
          //   },
          // ),
          // Container(
          //   height: 1.h,
          //   width: double.infinity,
          // ),
          DrawerTileWidget(
            icon: AssetIcons.logout,
            title: 'Logout',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ContactScreen());
            },
          ),
          UIHelper.verticalSpaceLarge,
        ],
      ),
    );
  }
}
