import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../widgets/loading_indicators.dart';
import 'api.dart';

class GetEmpApilRX {
  final api = GetEmpApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getEmpResStream => _dataFetcher.stream;

  Future<void> getEmployee() async {
    final storage = GetStorage();
    try {
      Map<String, dynamic> data = {"user_id": storage.read(kKeyUserID)};
      Map resdata = await api.getEmp(storage.read(kKeyUserID), data);

      _dataFetcher.sink.add(resdata);
      String empID = resdata["employee"]["id"];
      storage.write(kKeyEmployeeID, empID);
    } catch (e) {
      log(e.toString());
      _dataFetcher.sink.addError(e);
    } finally {}
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
