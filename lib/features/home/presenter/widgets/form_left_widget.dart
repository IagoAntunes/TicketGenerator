import 'package:flutter/material.dart';
import 'package:generateticket/core/states/ticket_state.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles/colors.dart';
import '../controller/home_controller.dart';

class FormLeft extends StatelessWidget {
  const FormLeft({
    super.key,
    required this.linearGradient,
    required this.constraints,
    required this.controller,
  });
  final HomeController controller;
  final Shader linearGradient;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.spaceGrotesk(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              foreground: Paint()..shader = linearGradient,
            ),
            children: const [
              TextSpan(
                text: 'GERE SEU TICKET\n',
              ),
              TextSpan(
                text: 'E COMPARTILHE\n',
              ),
              TextSpan(
                text: 'COM O MUNDO',
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Obx(() {
          return Visibility(
            visible: controller.state.value.runtimeType != SuccessTicketState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DIGITE SEU USUÁRIO DO GITHUB',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    color: AppColors.grayLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: constraints.maxWidth < 600
                      ? constraints.maxWidth
                      : constraints.maxWidth * 0.5,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  constraints: const BoxConstraints(maxWidth: 380),
                  decoration: const BoxDecoration(color: AppColors.grayLight),
                  child: TextField(
                    controller: controller.userController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Image.asset(
                        'assets/images/logo_github.png',
                      ),
                      hintText: 'Nome de usuário',
                      hintStyle: GoogleFonts.spaceGrotesk(
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Visibility(
                  visible:
                      controller.state.value.runtimeType == FailureTicketState,
                  child: Text(
                    'Usuário inválido. Verifique e tente novamente.',
                    style: GoogleFonts.roboto(
                      color: AppColors.danger,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        Obx(() {
          return Visibility(
            visible: controller.state.value.runtimeType == SuccessTicketState,
            child: Row(
              children: [
                const Icon(
                  Icons.check,
                  color: AppColors.success,
                ),
                const SizedBox(width: 10),
                Text(
                  'TICKET GERADO COM SUCESSO',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    color: AppColors.grayLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 16),
        Container(
          width: constraints.maxWidth < 600
              ? constraints.maxWidth
              : constraints.maxWidth * 0.5,
          constraints: const BoxConstraints(maxWidth: 380),
          child: Obx(() {
            return ElevatedButton(
              onPressed: () {
                if (controller.state.value.runtimeType != LoadingTicketState) {
                  controller.getProfile();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purpleNormal,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 40,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: controller.state.value.runtimeType == LoadingTicketState
                  ? const CircularProgressIndicator()
                  : Text(
                      controller.state.value.runtimeType == SuccessTicketState
                          ? 'FAZER DOWNLOAD'
                          : "GERAR MEU TICKET",
                      style: GoogleFonts.spaceGrotesk(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
            );
          }),
        )
      ],
    );
  }
}
