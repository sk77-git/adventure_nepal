import 'package:adventure_nepal/app/theme/app_colors.dart';
import 'package:adventure_nepal/app/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_images.dart';
import '../../../widgets/app_text.dart';
import '../../home/model/activities_response.dart';
import '../controllers/activity_detail_controller.dart';

class ActivityDetailView extends GetView<ActivityDetailController> {
  const ActivityDetailView(this.activity, {Key? key}) : super(key: key);
  final Activity? activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              activity?.thumbnail ?? "",
              errorBuilder: (a, b, c) {
                return Image.asset(AppImages.appLogo);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            AppText(
              text: activity?.name ?? "",
              style: AppStyles.headingStyle
                  .copyWith(fontSize: 30, color: AppColors.mainColor),
            ),
            // AppText(
            //   text:
            //       "Preferred at: ${activity?.maxTemp ?? "n/a"}°C - ${activity?.minTemp ?? ""}°C",
            //   style: AppStyles.subtitleStyle,
            // ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "About this activity:\n${activity?.description ?? ""}",
              style: AppStyles.titleStyle.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
