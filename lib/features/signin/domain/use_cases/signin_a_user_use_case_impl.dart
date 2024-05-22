import 'package:get_it/get_it.dart';
import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/signin.dart';

class SigninAUserUseCaseImpl implements SigninAUserUseCase {
  late SigninRepository _repository;

  SigninAUserUseCaseImpl([SigninRepository? repository]) {
    _repository = repository ?? GetIt.I.get<SigninRepository>();
  }

  @override
  Future<Resource<User, String>> call({
    required String email,
    required String password,
  }) async =>
      await _repository.signinUser(
        email: email,
        password: password,
      );
}
