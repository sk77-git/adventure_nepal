import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/activity_detail/views/activity_detail_view.dart';
import 'package:adventure_nepal/app/modules/home/model/activities_response.dart';
import 'package:adventure_nepal/app/modules/home/model/place_response.dart';
import 'package:adventure_nepal/app/modules/place_detail/views/place_detail_view.dart';
import 'package:adventure_nepal/app/modules/profile/views/profile_view.dart';
import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:adventure_nepal/app/widgets/activity_card.dart';
import 'package:adventure_nepal/app/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../theme/app_styles.dart';
import '../../../widgets/app_text.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  Future<void> refresh() async {
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              weatherCard(context),
              const SizedBox(
                height: 16,
              ),
              recommendedPlaces(),
              const SizedBox(
                height: 16,
              ),
              recommendedActivities(),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      toolbarHeight: 70,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => AppText(
                text: controller.greeting.value,
                fontWeight: FontWeight.bold,
                fontSize: AppDimens.veryLargeTextSize,
                color: AppColors.textColor.withOpacity(0.7),
              )),
          AppText(
            text: StorageUtil.getUser()?.fullName ?? "N/A",
            fontSize: AppDimens.smallTextSize,
            color: AppColors.textColor.withOpacity(0.5),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => const ProfileView());
          },
          icon: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.indigo.shade300.withOpacity(0.1),
              image: const DecorationImage(
                  image: AssetImage(AppImages.mountain), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          iconSize: 50.0,
        )
      ],
    );
  }

  Widget weatherCard(BuildContext context) {
    return Obx(() {
      var response = controller.weatherResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        case ApiStatus.ERROR:
          {
            return ErrorsWidget(
                height: 230,
                title: "Weather Information",
                error: controller.placesResponse.value.message ?? "");
          }
        case ApiStatus.SUCCESS:
          {
            return Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          response.response?.current?.condition?.text ?? "....",
                          style: AppStyles.headingStyle
                              .copyWith(color: AppColors.mainColor),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text(
                          response.response?.current?.lastUpdated ??
                              "Updated at: ...",
                          style: AppStyles.subtitleStyle
                              .copyWith(color: AppColors.grey),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: (response.response?.current?.feelslikeC ?? 0)
                            .toString(),
                        style: AppStyles.headingStyle
                            .copyWith(color: AppColors.mainColor, fontSize: 50),
                      ),
                      AppText(
                          text: "°C",
                          style: AppStyles.headingStyle.copyWith(
                              color: AppColors.secondary, fontSize: 30)),
                      const Spacer(),
                      SizedBox(
                          width: 70,
                          child: Image.network(
                            "https:${response.response?.current?.condition?.icon}",
                            fit: BoxFit.fitHeight,
                            errorBuilder: (BuildContext context, Object o,
                                StackTrace? s) {
                              return Container();
                            },
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.secondary,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                          text: response.response?.location?.name ?? "Location",
                          style: AppStyles.titleStyle.copyWith(
                            color: AppColors.mainColor,
                          ))
                    ],
                  )
                ],
              ),
            );
          }
        default:
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }
    });
  }

  Widget recommendedPlaces() {
    return Obx(() {
      var data = controller.placesResponse.value;
      switch (data.status) {
        case ApiStatus.LOADING:
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        case ApiStatus.ERROR:
          {
            return ErrorsWidget(
                height: 230,
                title: "Recommended Places",
                error: controller.placesResponse.value.message ?? "");
          }
        case ApiStatus.SUCCESS:
          {
            return controller.places.isEmpty
                ? const ErrorsWidget(
                    height: 230,
                    title: "Recommended Places",
                    error: "No Places Found")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Recommended Places",
                          style: AppStyles.headingStyle),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.response?.places?.length ?? 0,
                            itemBuilder: (ctx, index) {
                              Place? place = data.response?.places![index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => PlaceDetailView(place));
                                },
                                child: PlaceCard(
                                    title: place?.name ?? "N/A",
                                    imageUrl: place?.thumbnail ?? ""),
                              );
                            }),
                      )
                    ],
                  );
          }
        default:
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }
    });
  }

  Widget recommendedActivities() {
    return Obx(() {
      var response = controller.activitiesResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        case ApiStatus.ERROR:
          {
            return ErrorsWidget(
                height: 230,
                title: "Recommended Activities",
                error: controller.placesResponse.value.message ?? "");
          }
        case ApiStatus.SUCCESS:
          {
            return controller.activities.isEmpty
                ? const ErrorsWidget(
                    height: 230,
                    title: "Recommended Activities",
                    error: "No Activities Found")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Recommended Activities",
                          style: AppStyles.headingStyle),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                response.response?.activities?.length ?? 0,
                            itemBuilder: (ctx, index) {
                              Activity? activity =
                                  response.response?.activities![index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => ActivityDetailView(activity));
                                },
                                child: ActivityCard(
                                    title: activity?.name ?? "N/A",
                                    imageUrl: activity?.thumbnail ?? ""),
                              );
                            }),
                      )
                    ],
                  );
          }
        default:
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }
    });
  }
}

class ErrorsWidget extends StatelessWidget {
  const ErrorsWidget(
      {super.key,
      required this.height,
      required this.title,
      required this.error});

  final double height;
  final String title;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.mainColor.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(text: title, style: AppStyles.headingStyle),
          const SizedBox(
            height: 16,
          ),
          SizedBox(width: 120, child: Image.asset(AppImages.info)),
          const SizedBox(height: 16),
          Text(error),
        ],
      ),
    );
  }
}
