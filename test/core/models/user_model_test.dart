import 'package:flutter_test/flutter_test.dart';
import 'package:generateticket/core/models/user_model.dart';

void main() {
  UserModel user = UserModel(name: 'name', avatarUrl: 'teste');
  group('UserModel | ', () {
    test('toMap()', () {
      Map<String, dynamic> map = {
        'name': user.name,
        'avatarUrl': user.avatarUrl,
      };

      expect(map, user.toMap());
    });

    test('fromMap()', () {
      Map<String, dynamic> map = {
        'login': 'nome',
        'avatar_url': 'path',
      };

      expect(
        UserModel.fromMap(map),
        isA<UserModel>(),
      );
    });
  });
}
