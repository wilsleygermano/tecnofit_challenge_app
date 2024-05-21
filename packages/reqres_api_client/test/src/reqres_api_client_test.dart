import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reqres_api_client/reqres_api_client.dart';

void main() {
  late ReqResApiClient client;
  late MockRemoteClient mockRemoteClient;

  setUp(() {
    mockRemoteClient = MockRemoteClient();
    client = ReqResApiClient(mockRemoteClient);
  });

  group("[ReqRes API Client Group Test]", () {
    test("Should Successfuly register a user", () async {
      // Arrange
      const Map<String, dynamic> body = {};

      // Act
      when(() => mockRemoteClient.post(
              url: any(named: 'url'), body: any(named: 'body')))
          .thenAnswer((_) async => Response.success(data: {}));
      final call = await client.register(body: body);

      // Assert
      expect(call.status, Status.success);
      expect(call.hasError, false);
      expect(call.data, isA<Map<String, dynamic>?>());
    });

    test("Should return an error after registering a user", () async {
      // Arrange
      const Map<String, dynamic> body = {};

      // Act
      when(() => mockRemoteClient.post(
              url: any(named: 'url'), body: any(named: 'body')))
          .thenAnswer((_) async => Response.failed(error: 'error'));
      final call = await client.register(body: body);

      // Assert
      expect(call.status, Status.failed);
      expect(call.hasError, true);
    });

    test("Should Successfuly get a user", () async {
      // Arrange
      const userId = '1';

      // Act
      when(() => mockRemoteClient.get(url: any(named: 'url'), query: userId))
          .thenAnswer((_) async => Response.success(data: {}));
      final call = await client.getUser(userId: userId);

      // Assert
      expect(call.status, Status.success);
      expect(call.hasError, false);
      expect(call.data, isA<Map<String, dynamic>>());
    });

    test("Should return an error after getting a user", () async {
      // Arrange
      const Map<String, dynamic> body = {};

      // Act
      when(() => mockRemoteClient.post(
              url: any(named: 'url'), body: any(named: 'body')))
          .thenAnswer((_) async => Response.failed(error: 'error'));
      final call = await client.register(body: body);

      // Assert
      expect(call.status, Status.failed);
      expect(call.hasError, true);
    });
  });
}

class MockRemoteClient extends Mock implements RemoteClient {}
