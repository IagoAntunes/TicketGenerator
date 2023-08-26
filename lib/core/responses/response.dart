import 'package:generateticket/core/models/user_model.dart';

abstract class IResponse {}

class SuccessResponse extends IResponse {
  UserModel user;
  SuccessResponse({
    required this.user,
  });
}

class FailureResponse extends IResponse {
  String message;
  FailureResponse({
    required this.message,
  });
}
