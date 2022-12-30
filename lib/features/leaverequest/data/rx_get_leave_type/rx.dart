import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetLeaveTypeReqRX {
  final api = GetLeaveTypeApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getLeaveTypeStream => _dataFetcher.stream;

  Future<void> fetchLeaveTypeReq() async {
    try {
      Map data = await api.fetchLeaveType();
      _dataFetcher.sink.add(data);
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
