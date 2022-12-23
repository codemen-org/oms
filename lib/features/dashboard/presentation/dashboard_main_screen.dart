import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plix/constants/app_color.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:plix/features/dashboard/presentation/tabs/dashboard_screen.dart';
import 'package:plix/features/dashboard/presentation/tabs/total_list.dart';
import 'package:plix/helpers/appbarname_helper.dart';
import 'package:plix/helpers/navigation_service.dart';
import 'package:plix/provider/catpopup_status.dart';
import 'package:provider/provider.dart';

import '../../../constants/text_font_style.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../widgets/app_drawer.dart';

class DashBoardMainScreen extends StatefulWidget {
  const DashBoardMainScreen({super.key});

  @override
  State<DashBoardMainScreen> createState() => _DashBoardMainScreenState();
}

class _DashBoardMainScreenState extends State<DashBoardMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    appBarName(name: "Overview", context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Consumer<AppBarNameProvider>(
            builder: (context, value, child) => Text(value.name)),
        actions: [
          InkWell(
            onTap: () {
              NavigationService.navigateTo(Routes.leaveReqScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(AssetIcons.buttonPlusIcon, height: 25),
            ),
          )
        ],
      ),
      body: Column(children: [
        UIHelper.verticalSpaceSmall,
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
                appBarName(name: "Overview", context: context);
              } else if (val == 1) {
                appBarName(name: "Total List", context: context);
              }
            },
            automaticIndicatorColorAdjustment: true,
            isScrollable: false,
            labelColor: AppColors.primeryColor,
            tabs: <Widget>[
              Text(
                "Overview",
              ),
              Text(
                "Total List",
              ),
            ],
          ),
        ),
        UIHelper.verticalSpaceSmall,
        Flexible(
          fit: FlexFit.loose,
          child: TabBarView(
            controller: tabController,
            children: const <Widget>[DashboardScreen(), LeaveListScreen()],
          ),
        ),
      ]),
    );
  }
}
