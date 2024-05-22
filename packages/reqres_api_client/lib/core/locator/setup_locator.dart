import 'package:get_it/get_it.dart';
import 'package:reqres_api_client/core/core.dart';

void setupLocator() {
  if (!GetIt.I.isRegistered<RemoteClient>()) {
    GetIt.I.registerLazySingleton<RemoteClient>(() => RemoteClientImpl());
  }
}
