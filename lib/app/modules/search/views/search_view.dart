import 'dart:math';

import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../theme/app_images.dart';
import '../../../theme/app_strings.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/search_box.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  SearchView({Key? key}) : super(key: key);

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
                text: "Search",
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

  String getRandomImage() {
    final Random random = Random();
    final int r = random.nextInt(images.length);
    return images[r];
  }
}
