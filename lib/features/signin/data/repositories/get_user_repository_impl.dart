import 'package:get_it/get_it.dart';
import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/data/data_sources/get_user_data_source.dart';
import 'package:tecnofit_challenge_app/features/signin/domain/repositories/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  late GetUserDataSource _dataSource;

  GetUserRepositoryImpl([GetUserDataSource? dataSource]) {
    _dataSource = dataSource ?? GetIt.I.get<GetUserDataSource>();
  }

  @override
  Future<Resource<User, String>> getUser({int id = 4}) async {
    return await _dataSource.signinUser(id: id);
  }
}
