import 'package:flutter/material.dart';

import '../theme/app_images.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0, // Ensure a square aspect ratio for the image
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
                bottom: Radius.circular(10),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: AppImages.loading,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, url, error) => Image.asset(
                  AppImages.loading,
                  fit: BoxFit.fitHeight,
                ),
                image: imageUrl,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
  }
}
