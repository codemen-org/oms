import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../widgets/loading_indicators.dart';
import 'api.dart';

class GetLeaveDetailReqRX {
  final api = GetLeaveDetailApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getLeaveDetailStream => _dataFetcher.stream;

  Future<void> fetchLeavaveDetailReq(String id) async {
    try {
      showDialog(
        context: NavigationService.context,
        builder: (context) => loadingIndicatorCircle(context: context),
      );
      Map data = await api.fetchLeaveDetailByID(id);

      _dataFetcher.sink.add(data);
      NavigationService.goBack;
    } catch (e) {
      NavigationService.goBack;
      _dataFetcher.sink.addError(e);
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
