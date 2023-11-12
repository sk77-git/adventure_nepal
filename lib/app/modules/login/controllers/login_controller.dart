import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../repository/auth_repo.dart';
import '../model/login_response.dart';

class LoginController extends GetxController {
  var loginResponse = ApiResponse<LoginResponse>.initial().obs;

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

  Future<ApiResponse<LoginResponse>> doLogin(
      String email, String password) async {
    loginResponse.value = ApiResponse<LoginResponse>.loading();
    var body = {"email": email, "password": password};
    loginResponse.value = await AuthRepo.login(body);
    return loginResponse.value;
  }
}
