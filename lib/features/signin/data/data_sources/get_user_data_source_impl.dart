import 'package:reqres_api_client/reqres_api_client.dart';
import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/data/data_sources/get_user_data_source.dart';
import 'dart:developer' as developer;

class GetUserDataSourceImpl implements GetUserDataSource {
  final String _tag = 'Get  Data Source';
  late ReqResApiClient _apiClient;

  GetUserDataSourceImpl([ReqResApiClient? apiClient]) {
    _apiClient = apiClient ?? ReqResApiClient();
  }

  @override
  Future<Resource<User, String>> signinUser({int id = 4}) async {
    try {
      developer.log(
        "Getting user with id: $id",
        name: _tag,
      );
      final response = await _apiClient.getUser(userId: id.toString());
      if (response.hasError) {
        developer.log(
          "Error registering user with ID: $id",
          name: _tag,
          level: 1000,
          error: response.error,
        );
        return Resource.failed(error: response.error);
      }
      final user = User.fromJson(response.data!['data']);
      developer.log(
        "User registered with ID: $id",
        name: _tag,
      );
      return Resource.success(data: user);
    } catch (e) {
      developer.log(
        "Error registering user with ID: $id",
        name: _tag,
        level: 1000,
        error: e.toString(),
      );
      return Resource.failed(error: e.toString());
    }
  }
}
