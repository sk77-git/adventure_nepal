import 'package:get/get.dart';

import '../controllers/activity_detail_controller.dart';

class ActivityDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityDetailController>(
      () => ActivityDetailController(),
    );
  }
}
