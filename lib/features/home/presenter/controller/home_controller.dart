import 'package:flutter/material.dart';
import 'package:generateticket/core/models/user_model.dart';
import 'package:get/get.dart';

import 'package:generateticket/core/states/ticket_state.dart';
import 'package:generateticket/features/home/domain/repositories/home_repositories.dart';

class HomeController extends GetxController {
  IHomeRepository repository;

  TextEditingController userController = TextEditingController();
  Rx<UserModel?> user = Rx<UserModel?>(null);
  Rx<ITicketState> state = ITicketState().obs;
  HomeController({
    required this.repository,
  });

  Future<void> getProfile() async {
    state.value = LoadingTicketState();
    await repository.getProfile(userController.text).then((value) {
      value.fold((l) {
        state.value = SuccessTicketState();
        user.value = l;
      }, (r) {
        state.value = FailureTicketState();
        userController.text = '';
      });
    });
  }
}
