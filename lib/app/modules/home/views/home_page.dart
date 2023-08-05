import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../theme/app_styles.dart';
import '../../../widgets/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            weatherCard(context),
            const SizedBox(height: 16,),
            recommendedPlaces(),
            const SizedBox(height: 16,),
            recommendedActivities()
          ],
        ),
      ),
    );
  }

  AppBar appbar(){
    return AppBar(
      toolbarHeight: 70,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Good Evening!",
            fontWeight: FontWeight.bold,
            fontSize: AppDimens.veryLargeTextSize,
            color: AppColors.textColor.withOpacity(0.7),
          ),
          AppText(
            text: "Shrawan Kumar",
            fontSize: AppDimens.smallTextSize,
            color: AppColors.textColor.withOpacity(0.5),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
          },
          icon: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.indigo.shade300.withOpacity(0.1),
              image: const DecorationImage(
                  image: AssetImage(AppImages.mountain),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          iconSize: 50.0,
        )
      ],
    );
  }

  Widget weatherCard(BuildContext context){
    return  Container(
      width: double.maxFinite,
        padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: AppColors.mainColor.withOpacity(0.1),
    borderRadius: const BorderRadius.all(Radius.circular(10))
    ), child: Column(
      children: [
        Row(
          children: [
            AppText(text: "Partly Cloudy", style: AppStyles.headingStyle.copyWith(color: AppColors.mainColor),),
            const Spacer(),
            AppText(text: "2022-08-01 10.02 AM", style: AppStyles.subtitleStyle.copyWith(color: AppColors.grey),)
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: "15.0", style: AppStyles.headingStyle.copyWith(color: AppColors.mainColor, fontSize: 50),),
            AppText(text: "°C", style: AppStyles.headingStyle.copyWith(color: AppColors.secondary, fontSize: 30)),
            const Spacer(),
            SizedBox(
                width: 50,
                child: Image.asset(AppImages.sunnyDay)),
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
            const Icon(Icons.location_on, color: AppColors.secondary,size: 16,),
            const SizedBox(width: 5,),
            AppText(text: "Kathmandu", style: AppStyles.titleStyle.copyWith(color: AppColors.mainColor,))
          ],
        )
      ],
    ),);
  }

  Widget recommendedPlaces(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(text: "Recommended Places", style: AppStyles.headingStyle),
        const SizedBox(height: 16,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (ctx, context){
            return  Container(
              margin: const EdgeInsets.only(right: 16),
              width: 150,
              decoration: BoxDecoration(
                color: Colors.indigo.shade300.withOpacity(0.1),
                image: const DecorationImage(
                    image: AssetImage(AppImages.mountain),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        )

      ],
    );

  }
  Widget recommendedActivities(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(text: "Recommended Activities", style: AppStyles.headingStyle),
        const SizedBox(height: 16,),
        SizedBox(
          height: 70,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (ctx, context){
                return  Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade300.withOpacity(0.1),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.balooning),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
        )

      ],
    );

  }
}
