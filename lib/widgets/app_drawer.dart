import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/widgets/draw_tile_widget.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../helpers/all_routes.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceSemiLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AssetIcons.splash,
                  scale: 3,
                ),
                DrawerTileWidget(
                  color: AppColors.primeryColor,
                  icon: AssetIcons.closeIcon,
                  title: '',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            UIHelper.verticalSpaceSemiLarge,
            DrawerTileWidget(
              icon: AssetIcons.dashboard,
              title: 'Dashboard',
              onTap: () {
                NavigationService.navigateToReplacement(
                    Routes.dashBoardMainScreen);
              },
            ),
            DrawerTileWidget(
              icon: AssetIcons.user,
              title: 'Profiles',
              onTap: () {
                NavigationService.navigateToReplacement(Routes.profileScreen);
              },
            ),
            DrawerTileWidget(
              icon: AssetIcons.hrm,
              title: 'HRM',
              onTap: () {},
            ),
            DrawerTileWidget(
              icon: AssetIcons.logout,
              title: 'Logout',
              onTap: () {},
            ),
            UIHelper.verticalSpaceLarge,
          ],
        ),
      ),
    );
  }
}
