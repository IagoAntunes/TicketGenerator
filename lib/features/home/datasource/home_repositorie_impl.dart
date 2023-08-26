import 'package:dartz/dartz.dart';

import 'package:generateticket/core/models/user_model.dart';
import 'package:generateticket/features/home/datasource/home_datasource.dart';
import 'package:generateticket/features/home/domain/repositories/home_repositories.dart';

class HomeRepositorieImpl extends IHomeRepositories {
  IHomeDatasource data;
  HomeRepositorieImpl({
    required this.data,
  });
  @override
  Future<Either<UserModel, String>> getProfile(String user) async {
    return await data.getProfile(user).then((value) {
      return value.fold((l) {
        return Left(l.user);
      }, (r) {
        return Right(r.message);
      });
    });
  }
}
