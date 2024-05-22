import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';

abstract class SigninDataSource {
  Future<Resource<User, String>> signinUser({
    required String email,
    required String password,
  });
}
