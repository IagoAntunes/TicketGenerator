import 'package:dartz/dartz.dart';
import 'package:generateticket/core/models/user_model.dart';

abstract class IHomeRepositories {
  Future<Either<UserModel, String>> getProfile(String user);
}
