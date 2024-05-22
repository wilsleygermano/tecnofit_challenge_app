import 'package:get_it/get_it.dart';
import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/domain/repositories/get_user_repository.dart';
import 'package:tecnofit_challenge_app/features/signin/domain/use_cases/get_user_use_case.dart';

class GetUserUseCaseImpl implements GetUserUseCase {
  late GetUserRepository _repository;

  GetUserUseCaseImpl([GetUserRepository? repository]) {
    _repository = repository ?? GetIt.I.get<GetUserRepository>();
  }
  @override
  Future<Resource<User, String>> call({int id = 4}) async {
    return await _repository.getUser(id: id);
  }
}
