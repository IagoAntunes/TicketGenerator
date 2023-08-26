import 'package:flutter/material.dart';
import 'package:generateticket/core/styles/colors.dart';
import 'package:generateticket/features/home/datasource/home_datasource.dart';
import 'package:generateticket/features/home/datasource/home_repositorie_impl.dart';
import 'package:generateticket/features/home/presenter/controller/home_controller.dart';

import '../widgets/form_left_widget.dart';
import '../widgets/infos_right_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = HomeController(
    repository: HomeRepositorieImpl(
      data: HomeDatasource(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return constraints.maxWidth < 600
                    ? SizedBox(
                        height: constraints.maxHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormLeft(
                              linearGradient: AppColors.linearGradient,
                              constraints: constraints,
                              controller: controller,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: constraints.maxHeight * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormLeft(
                              linearGradient: AppColors.linearGradient,
                              constraints: constraints,
                              controller: controller,
                            ),
                            const SizedBox(width: 32),
                            InfosRight(
                              constraints: constraints,
                              controller: controller,
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
