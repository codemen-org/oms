import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../helpers/navigation_service.dart';
import '../../../../../widgets/loading_indicators.dart';
import '../../../../networks/api_acess.dart';
import '/helpers/all_routes.dart';
import 'api.dart';

class PostLeaveReqRX {
  final api = PostLeaveReqApi();
  Map empty = {};
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getPostLeaveReqStream => _dataFetcher.stream;
  String message = "";
  Future<void> postLeaveReq({
    required String leave_type_id,
    required String reason,
    required String start_date,
    required String end_date,
    required String half_day,
  }) async {
    try {
      showDialog(
        context: NavigationService.context,
        builder: (context) => loadingIndicatorCircle(context: context),
      );
      Map data = await api.postLeaveReq(
          leave_type_id: leave_type_id,
          start_date: start_date,
          end_date: end_date,
          reason: reason,
          half_day: half_day);
      _dataFetcher.sink.add(data);
      getLeaveReqListRXObj.getLeaveListReq();
      NavigationService.goBack;
      if (data["success"] == false) {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      NavigationService.goBack;
      _dataFetcher.sink.addError(e);
    } finally {
      NavigationService.goBack;
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
