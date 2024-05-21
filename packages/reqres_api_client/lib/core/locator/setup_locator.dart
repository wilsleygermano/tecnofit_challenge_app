import 'package:get_it/get_it.dart';

import '../core.dart';

void setupLocator() {
  GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton<RemoteClient>(() => RemoteClientImpl());
}
