import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/repository/auth_repo.dart';
import 'package:get/get.dart';

import '../../../data/basic_api_response.dart';

class ForgotPasswordController extends GetxController {
  var forgotPasswordResponse = ApiResponse<BasicApiResponse>.initial().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<ApiResponse<BasicApiResponse>> forgotPassword(String email) async {
    forgotPasswordResponse.value = ApiResponse<BasicApiResponse>.loading();
    var body = {"email": email};
    forgotPasswordResponse.value = await AuthRepo.forgotPassword(body);
    return forgotPasswordResponse.value;
  }
}
