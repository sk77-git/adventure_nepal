import 'package:adventure_nepal/app/theme/app_colors.dart';
import 'package:adventure_nepal/app/theme/app_dimens.dart';
import 'package:adventure_nepal/app/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/routes/app_pages.dart';
/*
* 1. Add list of places with lat, long, tags
* 2. Fetch places based on user lat long and tags [preferences eg- historic, river, water, pond, temple, hindu etc]
* 3. Add list of activities that can be done in certain weather and place
*  
*
* */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    const Application(),
  );
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
              primarySwatch: Colors.indigo,
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(
                  color: AppColors.appBarIconColor, //appbar Icon color
                ),
                //appbar bg color
                color: AppColors.appBarColor,
                //appbar title text color
                foregroundColor: AppColors.appBarTextColor,
                elevation: AppDimens.appBarElevation,
                centerTitle: false,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  // Status bar color
                  statusBarColor: Colors.transparent,
                  // statusBarIconBrightness
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
              )),
        );
      },
    );
  }
}
