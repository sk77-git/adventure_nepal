import 'package:adventure_nepal/app/repository/auth_repo.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../data/basic_api_response.dart';

class ChangePasswordController extends GetxController {
  var changePasswordResponse = ApiResponse<BasicApiResponse>.initial().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<ApiResponse<BasicApiResponse>> changePassword(
      String email, String newPassword) async {
    changePasswordResponse.value = ApiResponse<BasicApiResponse>.loading();
    var body = {"email": email, "new_password": newPassword};
    changePasswordResponse.value = await AuthRepo.changePassword(body);
    return changePasswordResponse.value;
  }
}
