import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';

abstract class GetUserDataSource {
  Future<Resource<User, String>> signinUser({int id = 4});
}
