import 'package:get/get.dart';

import '../controllers/place_detail_controller.dart';

class PlaceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceDetailController>(
      () => PlaceDetailController(),
    );
  }
}
