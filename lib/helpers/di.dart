import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import '../provider/launch_status.dart';

final locator = GetIt.instance;

void diSetup() {
  locator.registerLazySingleton(() => FirebaseMessaging.instance);
  locator.registerLazySingleton(() => Launch());
}
