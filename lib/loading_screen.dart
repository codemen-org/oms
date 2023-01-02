import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:plix/features/dashboard/presentation/tabs/dashboard_screen.dart';

import 'package:plix/features/dashboard/presentation/tabs/total_list.dart';
import 'package:plix/helpers/di.dart';

import 'package:plix/helpers/helper.dart';
import 'package:plix/provider/launch_status.dart';
import 'package:plix/widgets/app_drawer.dart';

import 'features/dashboard/presentation/dashboard_main_screen.dart';
import 'helpers/notification_service.dart';
import 'navigation_screen.dart';
import 'networks/dio/dio.dart';

import 'features/authentication/presentation/login/login_screen.dart';
import 'welcome_screen.dart';
import 'constants/app_constants.dart';
import 'networks/api_acess.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  final appData = GetStorage();

  @override
  void initState() {
    if (locator<Launch>().firstLaunchSt) {
      appData.write(kKeyIsLoggedIn, false);
    }
    ;

    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    appData.writeIfNull(kKeyIsLoggedIn, false);
    if (appData.read(kKeyIsLoggedIn)) {
      getNoticeRXObj.fetchNotice();
      getLeaveTypeReqRXObj.fetchLeaveTypeReq();
      getLeaveReqListRXObj.getLeaveListReq();
      getProfileReqRXObj.fetchProfileData();
      getLeaveDBRXObj.getLeaveDBInfo();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return appData.read(kKeyIsLoggedIn)
          ? const DashBoardMainScreen()
          : const LogeinScreen();
    }
  }
}
