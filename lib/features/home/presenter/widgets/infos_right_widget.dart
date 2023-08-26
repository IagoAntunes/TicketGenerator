import 'package:flutter/material.dart';
import 'package:generateticket/features/home/presenter/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles/colors.dart';

class InfosRight extends StatelessWidget {
  const InfosRight({
    super.key,
    required this.constraints,
    required this.controller,
  });
  final HomeController controller;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth * 0.6,
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 40),
      decoration: const BoxDecoration(
        color: AppColors.purpleNormal,
      ),
      child: LayoutBuilder(builder: (context, constraints2) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: constraints2.maxWidth * 0.6,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  'assets/images/img_cover.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: constraints2.maxWidth * 0.3,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: LayoutBuilder(builder: (context, constraints2) {
                return Column(
                  children: [
                    Obx(() {
                      return ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(63),
                        ),
                        child: controller.user.value == null
                            ? Image.asset(
                                'assets/images/img_avatar.png',
                              )
                            : Image.network(
                                controller.user.value!.avatarUrl,
                                fit: BoxFit.cover,
                              ),
                      );
                    }),
                    const SizedBox(height: 16),
                    Text(
                      'TRIPULANTE',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.purpleNormal,
                      ),
                    ),
                    Obx(() {
                      return Text(
                        controller.user.value == null
                            ? 'Seu nome aqui'
                            : controller.user.value!.name,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyDark,
                        ),
                      );
                    }),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        SizedBox(
                          width: constraints2.maxWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'EVENTO',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyDark,
                                ),
                              ),
                              Text(
                                'IA PARA DEVS',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: constraints2.maxWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'DATA',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyDark,
                                ),
                              ),
                              Text(
                                '14 - 16 AGO.2023',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: constraints2.maxWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'HORA',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyDark,
                                ),
                              ),
                              Text(
                                'AO VIVO',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.greyDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Image.asset('assets/images/lines.png')
                  ],
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
