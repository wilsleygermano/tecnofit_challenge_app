import 'package:get_it/get_it.dart';
import 'package:tecnofit_challenge_app/features/signin/signin.dart';
import 'dart:developer' as developer;

void setupAppLocator() {
  developer.log('Setting Up GetIT', name: 'GetIt');
  GetIt.I.registerLazySingleton<SigninDataSource>(() => SigninDataSourceImpl());
  GetIt.I.registerLazySingleton<SigninRepository>(() => SigninRepositoryImpl());
  GetIt.I.registerLazySingleton<SigninAUserUseCase>(
      () => SigninAUserUseCaseImpl());
  GetIt.I.registerLazySingleton<GetUserDataSource>(() => GetUserDataSourceImpl());
  GetIt.I.registerLazySingleton<GetUserRepository>(() => GetUserRepositoryImpl());
  GetIt.I.registerLazySingleton<GetUserUseCase>(() => GetUserUseCaseImpl());
  developer.log('GetIt Setup Done', name: 'GetIt');
}
