import 'dart:convert';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';

class GetProfileApi {
  Future<Map> fetchProfileData(String id) async {
    final response = await getHttp(Endpoints.getProfile(id));

    if (response.statusCode == 200) {
      Map data = json.decode(json.encode(response.data));
      return data;
    }
    Map empty = {};
    return empty;
  }
}
