import 'package:adventure_nepal/app/modules/home/views/home_page.dart';
import 'package:adventure_nepal/app/modules/login/views/login_view.dart';
import 'package:adventure_nepal/app/theme/app_dimens.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(WelcomeController());

  var images = [
    "assets/images/welcome-one.png",
    "assets/images/welcome-two.png",
    "assets/images/welcome-three.png"
  ];
  var titles = ["Trips", "Flies", "Floats"];
  var subtitles = ["Mountain", "Paragliding", "Rivers"];
  var details = [
    "Mountain hikes gives you an incredible sense of freedom along with endurance test",
    "Fly in the open sky with the birds and free your body and mind.",
    "Rafting is the way get wet in enjoyment of nature"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.only(
                  top: 200, left: 20, right: 20, bottom: 0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Adaptive.w(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          text: titles[index],
                          color: AppColors.textColor,
                          fontSize: AppDimens.veryLargeTextSize,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: subtitles[index],
                          color: AppColors.grey,
                          fontSize: AppDimens.veryLargeTextSize,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: details[index],
                          fontSize: AppDimens.standardTextSize,
                          color: AppColors.mainColor.withOpacity(0.7),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AppButton(
                          onTap: () {
                            if (StorageUtil.isLoggedIn()) {
                              Get.offAll(() => const HomePage());
                            } else {
                              Get.offAll(() => const LoginView());
                            }
                          },
                          text: "  Let's Go  ",
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ...List.generate(
                          3,
                          (indexDots) => Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                height: index == indexDots ? 24 : 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? AppColors.mainColor
                                        : AppColors.mainColor.withOpacity(0.5)),
                              )),
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}
