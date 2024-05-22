import 'package:tecnofit_challenge_app/core/generics/resource.dart';
import 'package:tecnofit_challenge_app/core/models/user.dart';
import 'package:tecnofit_challenge_app/features/signin/data/data_sources/signin_data_source.dart';
import 'package:reqres_api_client/reqres_api_client.dart';
import 'dart:developer' as developer;

class SigninDataSourceImpl implements SigninDataSource {
  late ReqResApiClient _apiClient;

  SigninDataSourceImpl([ReqResApiClient? apiClient]) {
    _apiClient = apiClient ?? ReqResApiClient();
  }
  final String _tag = 'Register Data Source';
  @override
  Future<Resource<User, String>> signinUser({
    required String email,
    required String password,
  }) async {
    try {
      developer.log(
        "Registering user with email: $email",
        name: _tag,
      );
      final response = await _apiClient.signin(body: {
        'email': email,
        'password': password,
      });
      if (response.hasError) {
        developer.log(
          "Error registering user with email: $email",
          name: _tag,
          level: 1000,
          error: response.error,
        );
        return Resource.failed(error: response.error);
      }
      final user = User.fromJson(response.data!);
      developer.log(
        "User registered with email: $email",
        name: _tag,
      );
      return Resource.success(data: user);
    } catch (e) {
      developer.log(
        "Error registering user with email: $email",
        name: _tag,
        level: 1000,
        error: e.toString(),
      );
      return Resource.failed(error: e.toString());
    }
  }
}
