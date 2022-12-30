import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetNoticeListRX {
  final api = GetNoticeListApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getNoticeListData => _dataFetcher.stream;

  Future<void> fetchNotice() async {
    try {
      Map data = await api.getNotice();
      _dataFetcher.sink.add(data);
    } catch (e) {
      // print(e);
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
