import 'package:adventure_nepal/app/modules/profile/views/profile_view.dart';
import 'package:adventure_nepal/app/modules/search/views/search_view.dart';
import 'package:adventure_nepal/app/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../home/views/home_view.dart';
import '../../stats/views/stats_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);

  var pages = [HomeView(), StatsView(), SearchView(), ProfileView()].obs;
  var currentIndex = 0.obs;

  void onTap(int value) {
    currentIndex.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: onTap,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: AppDimens.bottomBarElevation,
          selectedItemColor: AppColors.appBarIconColor,
          unselectedItemColor: AppColors.grey.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Popular"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
