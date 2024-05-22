import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';

abstract class GetUserRepository {
  Future<Resource<User, String>> getUser({
    int id = 4,
  });
}
