import 'dart:async';
import 'dart:developer';

import 'package:adventure_nepal/app/modules/home/controllers/home_controller.dart';
import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:adventure_nepal/app/theme/app_strings.dart';
import 'package:adventure_nepal/app/widgets/app_text.dart';
import 'package:adventure_nepal/app/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../api/api_client.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../widgets/circle_indicator.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final controller = Get.put(HomeController());
  var kathmandu = {
    "Chandragiri": AppImages.chandragiri,
    "Dhulikhel": AppImages.dhulikhel,
    "Nagarkot": AppImages.nagarkot,
  };

  var bhaktapur = {
    "Durbar Square": AppImages.bktDurbarSquare,
    "Saaga": AppImages.saaga,
    "Nyatapola": AppImages.nyatapola,
  };

  var lalitpur = {
    "Mountain": AppImages.mountain,
    "Chandragiri": AppImages.chandragiri,
    "Nyatapola": AppImages.nyatapola,
  };
  var exploreMoreItems = {
    AppImages.balooning: "Balloning",
    AppImages.hiking: "Hiking",
    AppImages.rafting: "Rafting",
    AppImages.paragliding: "Paragliding",
    AppImages.camping: "Camping"
  };

  List<PaletteColor> colors = [];

  @override
  void initState() {
    super.initState();
    updatePaletteColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: weatherWidget(context), preferredSize: Size.fromHeight(70)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTabController(
                length: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                        isScrollable: true,
                        unselectedLabelStyle: const TextStyle(
                            fontSize: AppDimens.standardTextSize),
                        labelStyle: const TextStyle(
                            fontSize: AppDimens.standardTextSize,
                            fontWeight: FontWeight.w500),
                        labelColor: AppColors.textColor.withOpacity(0.7),
                        unselectedLabelColor:
                            AppColors.textColor.withOpacity(0.5),
                        labelPadding: const EdgeInsets.only(left: 0, right: 10),
                        indicator: CircleIndicator(
                            color: AppColors.mainColor, radius: 4),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(
                            text: "Kathmandu",
                          ),
                          Tab(
                            text: "Bhaktapur",
                          ),
                          Tab(
                            text: "Lalitpur",
                          ),
                        ]),
                    SizedBox(
                      height: 250,
                      width: double.maxFinite,
                      child: TabBarView(
                        children: [
                          ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: kathmandu.keys.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 10),
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(kathmandu.values
                                              .elementAt(index)),
                                          fit: BoxFit.cover),
                                    ));
                              }),
                          ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: bhaktapur.keys.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 10),
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(bhaktapur.values
                                              .elementAt(index)),
                                          fit: BoxFit.cover),
                                    ));
                              }),
                          ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: lalitpur.keys.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 10),
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              lalitpur.values.elementAt(index)),
                                          fit: BoxFit.cover),
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AppText(
                text: "Activities",
                fontSize: AppDimens.largeTextSize,
                color: AppColors.textColor.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 110,
                width: double.maxFinite,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: exploreMoreItems.keys.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        width: 80,
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colors.isNotEmpty
                                      ? colors[index].color.withOpacity(0.2)
                                      : AppColors.mainColor.withOpacity(0.2)
                                  /*image: DecorationImage(
                                      image: AssetImage(
                                        exploreMoreItems.keys.elementAt(index),
                                      ),
                                      fit: BoxFit.cover)*/
                                  ),
                              child: Image.asset(
                                exploreMoreItems.keys.elementAt(index),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: exploreMoreItems.values.elementAt(index),
                              color: AppColors.appBarTextColor,
                              fontSize: AppDimens.normalTextSize,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              AppText(
                text: "Experiences",
                fontSize: AppDimens.largeTextSize,
                color: AppColors.textColor.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return const BookTile(
                          title:
                              "One of the best place to visit when you go to Kathmandu - Chandragiri",
                          author: "SK Thakur",
                          date: "April 19, 2023 Friday",
                          imageUrl: "");
                    }),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Color> getMajorColorFromAsset(String assetImagePath) async {
    final ByteData byteData = await rootBundle.load(assetImagePath);
    final Uint8List bytes = byteData.buffer.asUint8List();
    final Completer<PaletteGenerator> completer = Completer();

    // Create an ImageProvider from the image bytes
    final ImageProvider imageProvider = MemoryImage(bytes);

    // Create a PaletteGenerator from the ImageProvider
    imageProvider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(PaletteGenerator.fromImageProvider(
          imageProvider,
          maximumColorCount: 20, // Customize the number of colors to extract
        ));
      }),
    );

    final PaletteGenerator paletteGenerator = await completer.future;

    return paletteGenerator.dominantColor!.color;
  }

  void updatePaletteColors() async {
    colors.clear();
    for (String image in exploreMoreItems.keys) {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(AssetImage(image),
              size: const Size(200, 100));
      colors.add(paletteGenerator.lightMutedColor ?? PaletteColor(Colors.indigo, 2));
    }
    setState(() {});
  }


  Widget weatherWidget(BuildContext context) {
    return Obx(() {
      final response = controller.weatherResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          log("ApiStatus.LOADING");
          return weatherAppBar();
        case ApiStatus.SUCCESS:
          log("ApiStatus.COMPLETED");
          return weatherAppBar();
        case ApiStatus.ERROR:
          log("ApiStatus.ERROR");
          return weatherAppBar();
        default:
          log("ApiStatus.default");
          return weatherAppBar();
      }
    });
  }

  /*AppBar appBar(){
    return AppBar(
      toolbarHeight: 70,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Location Unknown',
            fontWeight: FontWeight.bold,
            fontSize: AppDimens.veryLargeTextSize,
            color: AppColors.textColor.withOpacity(0.7),
          ),
          AppText(
            text: 'Weather: n/a',
            fontSize: AppDimens.smallTextSize,
            color: AppColors.textColor.withOpacity(0.5),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
          height: 40,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.cornerRadius),
              color: Colors.transparent,
              image: const DecorationImage(
                  image: AssetImage(AppImages.cloudyDay), fit: BoxFit.cover)),
        )
      ],
    );
  }*/
  AppBar weatherAppBar(){
    var data= controller.weatherResponse.value.response;
    return AppBar(
      toolbarHeight: 70,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: data?.location?.name??AppStrings.appName,
            fontWeight: FontWeight.bold,
            fontSize: AppDimens.veryLargeTextSize,
            color: AppColors.textColor.withOpacity(0.7),
          ),
          AppText(
            text: "${data?.current?.condition?.text??"Getting weather"} - ${(data?.current?.feelslikeC??0).toString()} °C",
            fontSize: AppDimens.smallTextSize,
            color: AppColors.textColor.withOpacity(0.5),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
      actions: [
        Image.network("https:${data?.current?.condition?.icon??""}", errorBuilder: (context, obj, stackTrace){
          return Container(
              margin: const EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 10),
              child: Image.asset(AppImages.cloudyDay));
        })
      ],
    );
  }
}
