import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:get/get.dart';

import '../../../data/basic_api_response.dart';
import '../../../repository/auth_repo.dart';

class OtpVerifyController extends GetxController {
  var verifyOtpResponse = ApiResponse<BasicApiResponse>.initial().obs;

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

  Future<ApiResponse<BasicApiResponse>> verifyOtp(
      String email, String otp) async {
    verifyOtpResponse.value = ApiResponse<BasicApiResponse>.loading();
    var body = {"email": email, "otp": otp, "purpose": "signup"};
    verifyOtpResponse.value = await AuthRepo.verifyOtp(body);
    return verifyOtpResponse.value;
  }
}
