import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:generateticket/core/models/user_model.dart';
import 'package:generateticket/core/states/ticket_state.dart';
import 'package:generateticket/features/home/datasource/home_repositorie_impl.dart';
import 'package:generateticket/features/home/domain/repositories/home_repositories.dart';
import 'package:generateticket/features/home/presenter/controller/home_controller.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepositorieImpl {}

void main() {
  late IHomeRepository mockRepository;
  late HomeController controller;

  setUp(() {
    mockRepository = MockHomeRepository();
    controller = HomeController(repository: mockRepository);
  });

  group('homeController | ', () {
    test('getProfile - Success', () async {
      when(() => mockRepository.getProfile(any())).thenAnswer((_) async {
        return Left(UserModel(avatarUrl: '', name: ''));
      });

      await controller.getProfile();

      expect(controller.state.value, isA<SuccessTicketState>());
      expect(controller.user.value, isA<UserModel>());
    });
    test('getProfile - Failure', () async {
      when(() => mockRepository.getProfile(any())).thenAnswer((_) async {
        return const Right('Tente Novamente');
      });

      await controller.getProfile();

      expect(controller.state.value, isA<FailureTicketState>());
      expect(true, controller.userController.text.isEmpty);
    });
  });
}
