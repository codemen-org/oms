import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plix/helpers/helper.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../constants/app_constants.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/notification_service.dart';
import '../../../../networks/api_acess.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../provider/launch_status.dart';
import '../../../../widgets/loading_indicators.dart';
import '/helpers/all_routes.dart';

import 'api.dart';

class GetLoginRX {
  final api = LoginApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getFileData => _dataFetcher.stream;
  String message = "";
  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      showDialog(
        context: NavigationService.context,
        builder: (context) => loadingIndicatorCircle(context: context),
      );
      Map data = await api.login(
        email,
        password,
      );
      _dataFetcher.sink.add(data);
      final storage = GetStorage();
      message = "Login Succefull"; //data["message"];
      String accesstoken = data['access_token'];
      String userId = data['user_id'];
      locator<Launch>().firstlaunch = false;
      setId();
      // String phone = data['data']['user']['phone'];
      // String firstName = data['data']['user']['first_name'];
      // String lastName = data['data']['user']['last_name'];
      // String id = data['data']['user']['id'].toString();
      // String user = data['data']['user']['email'];
      // int restaurantID = data['data']['restaurant']['id'];

      storage.write(kKeyIsLoggedIn, true);
      storage.write(kKeyAccessToken, accesstoken);
      storage.write(kKeyUserID, userId);

      // storage.write(kPhone, phone);
      // storage.write(kKeyFirstName, firstName);
      // storage.write(kKeyLastName, lastName);
      // storage.write(kKeyUserID, id);
      // storage.write(kKeyUser, user);
      // storage.write(kKeyRestaurantID, restaurantID);

      DioSingleton.instance.update(accesstoken);
      await getEmpApilRXObj.getEmployee();
      LocalNotificationService.getToken();
      NavigationService.goBack;
      NavigationService.popAndReplace(Routes.loadingScreen);
    } catch (e) {
      log(e.toString());
      NavigationService.goBack;
      _dataFetcher.sink.addError(e);
    } finally {
      ScaffoldMessenger.of(NavigationService.context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
