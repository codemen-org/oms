import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../constants/app_constants.dart';

import 'api.dart';

class GetLeaveDBRX {
  final api = GetLeaveDBApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getLeaveDBStream => _dataFetcher.stream;

  Future<void> getLeaveDBInfo() async {
    try {
      GetStorage storage = GetStorage();
      Map<String, dynamic> data = {
        "employee_id": storage.read(kKeyEmployeeID),
      };
      Map resdata = await api.getLeaveInfo(data);
      _dataFetcher.sink.add(resdata);
    } catch (e) {
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
