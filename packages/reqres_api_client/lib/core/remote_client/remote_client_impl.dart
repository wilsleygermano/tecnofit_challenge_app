import 'dart:convert';

import 'package:reqres_api_client/core/remote_client/remote_client.dart';
import 'package:http/http.dart' as http;
import 'package:reqres_api_client/core/generics/response.dart';

class RemoteClientImpl implements RemoteClient {
  late final http.Client _httpClient;

  RemoteClientImpl([http.Client? httpClient]) {
    _httpClient = httpClient ?? http.Client();
  }

  @override
  Future<Response<Map<String, dynamic>, String>> get(
      {Map<String, String>? headers,
      String? query,
      required String url}) async {
    try {
      final requestUrl = query != null ? '$url?$query' : url;
      final response =
          await _httpClient.get(Uri.parse(requestUrl), headers: headers);
      var responseData = jsonDecode(response.body);
      if (responseData is! Map<String, dynamic>) {
        return Response.failed(error: 'Invalid response');
      }
      return Response.success(data: responseData);
    } catch (e) {
      return Response.failed(error: e.toString());
    } finally {
      _httpClient.close();
    }
  }

  @override
  Future<Response<Map<String, dynamic>?, String>> post(
      {Map<String, String>? headers,
      required dynamic body,
      required String url}) async {
    try {
      final response = await _httpClient.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      var responseData = jsonDecode(response.body);
      if (responseData != null && responseData is! Map<String, dynamic>) {
        return Response.failed(error: 'Invalid response');
      }
      return Response.success(data: responseData);
    } catch (e) {
      return Response.failed(error: e.toString());
    } finally {
      _httpClient.close();
    }
  }
}
