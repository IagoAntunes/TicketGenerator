import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generateticket/core/models/user_model.dart';
import 'package:generateticket/core/responses/response.dart';
import 'package:generateticket/features/home/datasource/home_datasource.dart';
import 'package:generateticket/features/home/datasource/home_repositorie_impl.dart';
import 'package:generateticket/features/home/domain/repositories/home_repositories.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeDatasource extends Mock implements HomeDatasource {}

void main() {
  late IHomeRepository repository;
  late IHomeDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockHomeDatasource();
    repository = HomeRepositorieImpl(data: mockDatasource);
  });
  group('HomeRepository | ', () {
    test('getProfile - Success', () async {
      when(() => mockDatasource.getProfile(any()))
          .thenAnswer((invocation) async {
        return Left(SuccessResponse(user: UserModel(avatarUrl: '', name: '')));
      });

      final reuslt = await repository.getProfile('teste');

      expect(reuslt, isA<Left>());
    });
    test('getProfile - Failure', () async {
      when(() => mockDatasource.getProfile(any()))
          .thenAnswer((invocation) async {
        return Right(FailureResponse(message: ''));
      });

      final reuslt = await repository.getProfile('teste');

      expect(reuslt, isA<Right>());
    });
  });
}
