import 'package:flutter/material.dart';

import '../theme/app_images.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo.shade300.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 170,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
                bottom: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Container(
                      color: Colors.indigo.shade300.withOpacity(0.1),
                      child: imageUrl.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              placeholder: AppImages.loading,
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, url, error) =>
                                  Image.asset(
                                AppImages.loading,
                                fit: BoxFit.cover,
                              ),
                              image: imageUrl,
                            )
                          : Image.asset(
                              AppImages.loading,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
