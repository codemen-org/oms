import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plix/widgets/custome_appbar.dart';

import '../../../constants/app_color.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/appbarname_helper.dart';
import '../../../helpers/ui_helpers.dart';
import 'tabs/about_screen.dart';
import 'tabs/information_screen.dart';
import 'tabs/social_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    appBarName(name: "Information", context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        custome_appbar(),
        SizedBox(
          child: TabBar(
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            indicatorColor: AppColors.primeryColor,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            unselectedLabelColor: AppColors.disabledColor,
            labelStyle: TextFontStyle.headline11StyleInter.copyWith(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                overflow: TextOverflow.ellipsis),
            onTap: (val) {
              tabController.index = val;
              if (val == 0) {
                appBarName(name: "Information", context: context);
              } else if (val == 1) {
                appBarName(name: "Social", context: context);
              } else if (val == 2) {
                appBarName(name: "About", context: context);
              }
            },
            automaticIndicatorColorAdjustment: true,
            isScrollable: false,
            labelColor: AppColors.primeryColor,
            tabs: <Widget>[
              Text(
                "Information",
              ),
              Text(
                "Social",
                textAlign: TextAlign.center,
              ),
              Text(
                "About",
              ),
            ],
          ),
        ),
        UIHelper.verticalSpaceSmall,
        Flexible(
          fit: FlexFit.loose,
          child: TabBarView(
            controller: tabController,
            children: const <Widget>[
              InformationScreen(),
              SocialScreen(),
              AboutScreen(),
            ],
          ),
        ),
      ]),
    );
  }
}
