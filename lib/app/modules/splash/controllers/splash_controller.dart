import 'package:adventure_nepal/app/modules/home/views/home_page.dart';
import 'package:adventure_nepal/app/modules/welcome/views/welcome_view.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splash();
  }

  Future<void> splash() async {
    Future.delayed(const Duration(seconds: 2), () {
      bool isLoggedIn = StorageUtil.isLoggedIn();
      if (isLoggedIn) {
        // StorageUtil.setIsLoggedIn(false);
        Get.offAll(() => const HomePage());
      } else {
        Get.offAll(() => WelcomeView());
      }
    });
  }
}
