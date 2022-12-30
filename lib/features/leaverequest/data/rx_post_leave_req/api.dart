import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../constants/app_constants.dart';
import '/networks/endpoints.dart';

class PostLeaveReqApi {
  Future<Map> postLeaveReq({
    required String leave_type_id,
    required String reason,
    required String start_date,
    required String end_date,
    required String half_day,
  }) async {
    final storage = GetStorage();
    String empID = storage.read(kKeyEmployeeID);
    Map data = {
      "employee_id": empID,
      "leave_type_id": leave_type_id,
      "reason": reason,
      "start_date": start_date,
      "end_date": end_date,
      "half_day": half_day
    };

    final response = await postHttp(Endpoints.postLeaveReq());

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));

      return data;
    }

    log(response);

    Map empty = {};
    return empty;
  }
}
