import 'package:adventure_nepal/app/modules/home/model/place_response.dart';
import 'package:adventure_nepal/app/theme/app_colors.dart';
import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:adventure_nepal/app/theme/app_styles.dart';
import 'package:adventure_nepal/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/place_detail_controller.dart';

class PlaceDetailView extends GetView<PlaceDetailController> {
  const PlaceDetailView(this.place, {Key? key}) : super(key: key);
  final Place? place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              place?.thumbnail ?? "",
              errorBuilder: (a, b, c) {
                return Image.asset(AppImages.appLogo);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            AppText(
              text: place?.name ?? "",
              style: AppStyles.headingStyle
                  .copyWith(fontSize: 30, color: AppColors.mainColor),
            ),
            AppText(
              text: "Lat Long: ${place?.lat ?? ""}, ${place?.long ?? ""}",
              style: AppStyles.subtitleStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            AppText(
              text: "Nearby Places: ${place?.nearbyPlaces ?? ""}",
              style: AppStyles.titleStyle
                  .copyWith(color: AppColors.mainColor.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "About this place:\n${place?.description ?? ""}",
              style: AppStyles.titleStyle.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
