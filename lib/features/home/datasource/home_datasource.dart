import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:generateticket/core/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/responses/response.dart';

abstract class IHomeDatasource {
  Future<Either<SuccessResponse, FailureResponse>> getProfile(String user);
}

class HomeDatasource extends IHomeDatasource {
  @override
  Future<Either<SuccessResponse, FailureResponse>> getProfile(
      String user) async {
    try {
      final result =
          await http.get(Uri.parse('https://api.github.com/users/$user'));

      if (result.statusCode == 200) {
        var data = jsonDecode(result.body);
        return Left(SuccessResponse(user: UserModel.fromMap(data)));
      } else {
        return Right(FailureResponse(message: 'Falha'));
      }
    } on Exception catch (e) {
      return Right(FailureResponse(message: e.hashCode.toString()));
    }
  }
}
