import 'dart:developer';

import 'package:adventure_nepal/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_images.dart';

class BookTile extends StatelessWidget {
  const BookTile(
      {Key? key,
      required this.title,
      required this.author,
      required this.date,
      required this.imageUrl})
      : super(key: key);

  final String title;
  final String author;
  final String date;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              child: Container(
                width: 90,
                height: 90,
                color: Colors.indigo.shade300.withOpacity(0.1),
                child: FadeInImage.assetNetwork(
                  placeholder: AppImages.placeholder,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, url, error) => Image.asset(
                    AppImages.placeholder,
                    fit: BoxFit.cover,
                  ),
                  image: imageUrl,
                ),
              )),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontSize: AppDimens.standardTextSize,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AppText(
                    text: "By: $author",
                    fontSize: AppDimens.smallTextSize,
                    color: AppColors.textColor.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  AppText(
                    text: "Published • ${getFormattedDate(date)}",
                    fontSize: AppDimens.smallTextSize,
                    color: AppColors.textColor.withOpacity(0.5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Get date as a string for display.
  String getFormattedDate(String date) {
    var outputDate = date;
    try {
      var localDate = DateTime.parse(date).toLocal();
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
      var inputDate = inputFormat.parse(localDate.toString());
      outputDate = DateFormat.yMMMEd().format(inputDate);
    } catch (e) {
      log(e.toString());
    }
    return outputDate.toString();
  }
}
