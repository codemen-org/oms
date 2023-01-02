import 'dart:convert';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';

class GetLeaveDetailApi {
  Future<Map> fetchLeaveDetailByID(String id) async {
    final response = await getHttp(
      Endpoints.getLeaveDetailByID(id),
    );

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));
      return data;
    }
    Map empty = {};
    return empty;
  }
}
