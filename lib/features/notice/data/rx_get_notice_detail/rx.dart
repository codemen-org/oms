import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetNoticeDetailRX {
  final api = GetNoticeDetailApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getNoticeDetailStream => _dataFetcher.stream;

  Future<void> fetchNoticeDetail(String id) async {
    try {
      Map data = await api.getNoticeDetail(id);
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
