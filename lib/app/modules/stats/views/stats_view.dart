import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../theme/app_images.dart';
import '../../../widgets/app_text.dart';
import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  StatsView({Key? key}) : super(key: key);

  List<String> images= [
    AppImages.chandragiri,
    AppImages.dhulikhel,
    AppImages.nagarkot,
    AppImages.fifityFiveWindow,
    AppImages.bktDurbarSquare,
    AppImages.nyatapola,
    AppImages.mountain,
    AppImages.saaga,
  ];


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
              text: "Gallery",
              fontWeight: FontWeight.bold,
              fontSize: AppDimens.veryLargeTextSize,
              color: AppColors.textColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
      body:GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Container(
          decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(getRandomImage()))
              ),
          ),
        ),
      )
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }
  String getRandomImage() {
    final Random random = Random();
    final int r = random.nextInt(images.length);
    return images[r];
  }

}

