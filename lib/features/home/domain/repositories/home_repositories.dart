import 'package:dartz/dartz.dart';
import 'package:generateticket/core/models/user_model.dart';

abstract class IHomeRepository {
  Future<Either<UserModel, String>> getProfile(String user);
}
