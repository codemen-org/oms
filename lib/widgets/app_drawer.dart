
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
      padding: EdgeInsets.symmetric(horizontal: 15.w),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30.w, top: 30.h),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled,
                      color: AppColors.primaryColor,
                      size: 40.sp,
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                AssetIcons.splashScreen,
                scale: 4,
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium,
          DrawerTileWidget(
            icon: AssetIcons.home,
            title: 'Dashboard',
            onTap: () {
              // Navigator.pushNamed(context, Route.navigation,
              //     arguments: const HomeScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.alertButtonColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.profile,
            title: 'Profile',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const SobrenosScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.alertButtonColor,
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
            color: AppColors.appColor000000,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.notice,
            title: 'Notice',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const PublicationScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.appColor000000,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.event,
            title: 'Event',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const FaqsScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.appColor000000,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.contact,
            title: 'Contact',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ServiceScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.appColor000000,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.logout,
            title: 'Logout',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ContactScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.activeColor,
            width: double.infinity,
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Social Network',
                    style: TextFontStyle.headline10StyleInter,
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (() {
                          var url = getProfileRXObj
                              .getProfileData.value['facebook_url']
                              .toString();
                          urlLunch(url);
                        }),
                        child: SvgPicture.asset(
                          //svg replace
                          AssetIcons.facebook,
                        ),
                      ),
                      UIHelper.horizontalSpaceSmall,
                      InkWell(
                        onTap: (() {
                          var url = getProfileRXObj
                              .getProfileData.value['instagram_url']
                              .toString();
                          urlLunch(url);
                        }),
                        child: SvgPicture.asset(
                          AssetIcons.instgram,
                          // color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              UIHelper.horizontalSpaceMedium,
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.primaryColor),
                        child: Image.asset('assets/images/r_logo.png'),
                      ),
                      UIHelper.horizontalSpaceSmall,
                      Text(
                        'CONTESTA\nNA HORA',
                        style: TextFontStyle.headline10StyleInter,
                      )
                    ],
                  ),
                ],
              ),
              UIHelper.horizontalSpaceMedium
            ],
          ),
          UIHelper.verticalSpaceLarge,
        ],
      ),
    );
  }
}
