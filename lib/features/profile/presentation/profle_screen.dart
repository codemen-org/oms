import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:plix/constants/text_font_style.dart';
import 'package:plix/features/profile/data/rx_post_reset_pw/api.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/helpers/all_routes.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/navigation_screen.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:plix/widgets/custom_button.dart';
import 'package:plix/widgets/loading_indicators.dart';

import '../../../constants/app_color.dart';
import '../../../networks/api_acess.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      //     leading: AppDrawer(),
      //     elevation: 0.0,
      //     toolbarHeight: .05.sh,
      //     title: Text(
      //       'Profile',
      //       style: TextFontStyle.headline3StyleInter
      //           .copyWith(color: AppColors.appColorFFFFFF),
      //     ),
      //     centerTitle: true),
      body: Column(
        children: [
          Container(
            height: .37.sh,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    color: AppColors.primeryColor,
                    height: .25.sh,
                    width: 1.sw,
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.menu, size: 24, color: AppColors.white),
                    title: Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.headline3StyleInter
                            .copyWith(color: AppColors.appColorFFFFFF),
                      ),
                    )),
                Positioned(
                  top: .115.sh,
                  left: .27.sw,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        border: Border.all(
                            width: 2, color: AppColors.appColorFF6F6F6)),
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundColor: AppColors.appColorFFFFFF,
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: NetworkImage(
                                "https://raw.githubusercontent.com/ArjunAtlast/Profile-Card/master/assets/john-doe.png"),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
