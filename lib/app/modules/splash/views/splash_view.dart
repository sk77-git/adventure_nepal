import 'package:adventure_nepal/app/theme/app_colors.dart';
import 'package:adventure_nepal/app/theme/app_dimens.dart';
import 'package:adventure_nepal/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/welcome-one.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: Device.height / 2.5,
              ),
              AppText(
                text: "Adventure Nepal",
                color: AppColors.primary.withOpacity(0.5),
                fontSize: AppDimens.veryLargeTextSize,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 8,
              ),
              AppText(
                text: "Version 1.0.0",
                color: AppColors.grey.withOpacity(0.5),
                fontSize: AppDimens.smallTextSize,
                fontWeight: FontWeight.w400,
              ),
            ],
          )),
    );
  }
}
