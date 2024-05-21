import 'package:get_it/get_it.dart';
import 'package:reqres_api_client/core/constants/api_routes.dart';

import '../core/core.dart';

class ReqResApiClient {
  late RemoteClient _remoteClient;

  ReqResApiClient([RemoteClient? remoteClient]) {
    if (remoteClient == null) {
      setupLocator();
      _remoteClient = GetIt.instance.get<RemoteClient>();
      return;
    }
    _remoteClient = remoteClient;
  }

  /// Registers a user with the provided [body] data.
  ///
  /// Returns a [Future] that completes with a [Response] object containing a [Map<String, dynamic>?] data and a [String] error message.
  Future<Response<Map<String, dynamic>?, String>> register({
    required dynamic body,
  }) async {
    return await _remoteClient.post(
      url: ApiRoutes.register,
      body: body,
    );
  }


  /// Retrieves a user from the API based on the provided [userId].
  ///
  /// Returns a [Future] that completes with a [Response] object containing a
  /// [Map] with the user data if the request is successful, or an error message
  /// if the request fails.
  ///
  /// The [userId] parameter is optional. If provided, the request will be
  /// filtered to retrieve only the user with the specified ID.
  Future<Response<Map<String, dynamic>, String>> getUser({
    String? userId,
  }) async {
    return await _remoteClient.get(
      url: ApiRoutes.users,
      query: userId,
    );
  }
}
