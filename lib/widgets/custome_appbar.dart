import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/helpers/ui_helpers.dart';
import 'package:plix/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../helpers/all_routes.dart';
import '../helpers/animation_helper.dart';
import '../provider/catpopup_status.dart';
import '../provider/hide_appbar_provider.dart';

class custome_appbar extends StatelessWidget {
  const custome_appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Consumer<HideAppBarProvider>(builder: (context, value, child) {
      return ExpandedSection(expand: !value.bar, child: appbar());
    });
  }
  }

class appbar extends StatelessWidget {
  const appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: .32.sh,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  color: AppColors.primeryColor,
                  height: .20.sh,
                  width: 1.sw,
                ),
              ),
              ListTile(
                onTap: () {
                  NavigationService.navigateTo(Routes.appDrawer);
                },
                leading: Icon(Icons.menu, size: 24, color: AppColors.white),
                title: Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Consumer<AppBarNameProvider>(
                    builder: (context, value, child) => Text(
                      value.name,
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline9StyleInter.copyWith(
                        color: AppColors.appColorFFFFFF,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: .08.sh,
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
        Text("John Doe", style: TextFontStyle.headline1StyleInter.copyWith(color: AppColors.text80),),
        UIHelper.verticalSpaceSmall,
        Text("Full Stack Web Developer \n @ codemen", style: TextFontStyle.headline11StyleInter.copyWith(color: AppColors.text60), textAlign: TextAlign.center,),
        UIHelper.verticalSpaceMedium,
      ],
    );
  }
}
