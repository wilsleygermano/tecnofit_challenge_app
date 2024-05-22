import 'package:get_it/get_it.dart';
import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/signin.dart';

class SigninRepositoryImpl implements SigninRepository {
  late SigninDataSource _dataSource;
  SigninRepositoryImpl([SigninDataSource? dataSource]) {
    _dataSource = dataSource ?? GetIt.I.get<SigninDataSource>();
  }

  @override
  Future<Resource<User, String>> signinUser(
          {required String email, required String password}) async =>
      await _dataSource.signinUser(
        email: email,
        password: password,
      );
}
