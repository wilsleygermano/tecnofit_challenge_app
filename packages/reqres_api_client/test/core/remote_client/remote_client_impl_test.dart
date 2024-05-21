import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:reqres_api_client/core/remote_client/remote_client_impl.dart';
import 'package:reqres_api_client/core/generics/generics.dart';
import 'package:reqres_api_client/core/generics/response.dart';

void main() {
  late http.Client httpClient;
  late RemoteClientImpl remoteClientImpl;
  const url = "https://reqres.in/api/users";

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  setUp(() {
    httpClient = MockHttpClient();
    remoteClientImpl = RemoteClientImpl(httpClient);
  });
  group("[Remote Client Implementation Group Test] -", () {
    group("/GET Group Test:", () {
      test("Should sucessfully perform a GET requisition", () async {
        // Arrange
        final response = MockResponse();

        // Act
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body)
            .thenReturn('{"id": "string", "token": "string"}');
        when(() => httpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer((_) async => response);

        final call = await remoteClientImpl.get(url: url);

        // Assert
        expect(call.status, Status.success);
        expect(call.hasError, false);
        expect(call.data, isA<Map<String, dynamic>>());
      });

      test("Should return an error after a GET", () async {
        // Arrange
        final response = MockResponse();

        // Act
        when(() => response.statusCode).thenReturn(400);
        when(() => response.body).thenReturn(jsonEncode('{"error": "string"}'));
        when(() => httpClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer((_) async => response);

        final call = await remoteClientImpl.get(url: url);

        // Assert
        expect(call.status, Status.failed);
        expect(call.hasError, true);
      });
    });

    group("/POST Group Test:", () {
      test("Should successfully perform a /POST", () async {
        // Arrange

        final response = MockResponse();

        // Act
        when(() => response.statusCode).thenReturn(201);
        when(() => response.body)
            .thenReturn('{"id": "string", "token": "string"}');
        when(() => httpClient.post(any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'))).thenAnswer((_) async => response);

        final call = await remoteClientImpl
            .post(body: {"id": "string", "token": "string"}, url: url);

        // Assert
        expect(call.status, Status.success);
        expect(call.hasError, false);
        expect(call.data, isA<Map<String, dynamic>>());
      });

      test("Should return an error after a /POST", () async {
        // Arrange
        final response = MockResponse();

        // Act
        when(() => response.statusCode).thenReturn(400);
        when(() => response.body).thenReturn(jsonEncode('{"error": "string"}'));
        when(() => httpClient.post(any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'))).thenAnswer((_) async => response);

        final call = await remoteClientImpl
            .post(body: {"id": "string", "token": "string"}, url: url);

        // Assert
        expect(call.status, Status.failed);
        expect(call.hasError, true);
      });
    });
  });
}

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}
