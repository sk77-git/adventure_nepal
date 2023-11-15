import 'package:get/get.dart';

import '../controllers/select_interests_controller.dart';

class SelectInterestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectInterestsController>(
      () => SelectInterestsController(),
    );
  }
}
