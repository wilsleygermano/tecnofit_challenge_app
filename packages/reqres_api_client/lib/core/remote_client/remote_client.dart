import '../generics/generics.dart';

abstract class RemoteClient {
  Future<Response<Map<String, dynamic>?, String>> post({
    Map<String, String>? headers,
    required dynamic body,
    required String url,
  });

  Future<Response<Map<String, dynamic>, String>> get({
    Map<String, String>? headers,
    String? query,
    required String url,
  });
}
