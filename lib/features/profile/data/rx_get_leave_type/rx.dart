import 'package:get_storage/get_storage.dart';
import 'package:plix/constants/app_constants.dart';
import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetProfileReqRX {
  final api = GetProfileApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getProfileResStream => _dataFetcher.stream;

  Future<void> fetchProfileData() async {
    GetStorage storage = GetStorage();
    try {
      Map data = await api.fetchProfileData(storage.read(kKeyUserID));
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
