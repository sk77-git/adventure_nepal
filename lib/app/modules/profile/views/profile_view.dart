import 'package:adventure_nepal/app/modules/login/views/login_view.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:adventure_nepal/app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../widgets/app_text.dart';
import '../../select_interests/views/select_interests_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "Profile",
              fontWeight: FontWeight.bold,
              fontSize: AppDimens.veryLargeTextSize,
              color: AppColors.textColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          AppButton(
              text: "Logout",
              onTap: () {
                StorageUtil.setIsLoggedIn(false);
                Get.offAll(() => const LoginView());
              }),
          const SizedBox(
            height: 16,
          ),
          AppButton(
              text: "Interests",
              onTap: () {
                Get.to(() => const SelectInterestsView());
              }),
        ],
      )),
    );
  }
}
