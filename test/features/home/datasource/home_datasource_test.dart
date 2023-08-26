import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generateticket/core/models/user_model.dart';
import 'package:generateticket/core/responses/response.dart';
import 'package:generateticket/features/home/datasource/home_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late HomeDatasource datasource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = HomeDatasource(httpClient: mockHttpClient);
  });

  group('HomeDatasource | ', () {
    test('getProfile - Success', () async {
      String mockUser = 'testUser';
      const mockResponse = '''
        {
          "login": "Teste login",
          "avatar_url": "Test User"
        }
      ''';

      when(() => mockHttpClient
              .get(Uri.parse('https://api.github.com/users/$mockUser')))
          .thenAnswer((_) async {
        return http.Response(mockResponse, 200);
      });

      final result = await datasource.getProfile(mockUser);

      expect(result, isA<Left>());

      result.fold(
        (success) {
          expect(success, isA<SuccessResponse>());
          final successData = success;
          expect(successData.user, isA<UserModel>());
        },
        (failure) {
          fail(
              'Esperava um resultado de sucesso, mas obteve um resultado de falha: $failure');
        },
      );
    });
    test('getProfile - Failure', () async {
      String mockUser = 'testUser';
      const mockResponse = '''
        {
          "login": "Teste login",
          "avatar_url": "Test User"
        }
      ''';

      when(() => mockHttpClient
              .get(Uri.parse('https://api.github.com/users/$mockUser')))
          .thenAnswer((_) async {
        return http.Response(mockResponse, 400);
      });

      var result = await datasource.getProfile(mockUser);

      expect(result, isA<Right>());

      result.fold(
        (_) {},
        (failure) {
          expect(failure.message, 'Falha');
        },
      );
      //Testar Exception
      when(() => mockHttpClient
              .get(Uri.parse('https://api.github.com/users/$mockUser')))
          .thenAnswer((_) async {
        throw Exception();
      });

      result = await datasource.getProfile(mockUser);

      expect(result, isA<Right>());

      result.fold(
        (_) {},
        (failure) {
          expect(failure.message, 'Tente Novamente');
        },
      );
    });
  });
}
