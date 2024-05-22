import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';

abstract class GetUserUseCase {
  Future<Resource<User, String>> call({int id = 4});
}
