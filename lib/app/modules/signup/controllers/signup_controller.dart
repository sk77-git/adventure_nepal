import 'package:adventure_nepal/app/data/basic_api_response.dart';
import 'package:adventure_nepal/app/repository/auth_repo.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';

class SignupController extends GetxController {
  var registerResponse = ApiResponse<BasicApiResponse>.initial().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<ApiResponse<BasicApiResponse>> register(
      String fullName, String email, String password) async {
    registerResponse.value = ApiResponse<BasicApiResponse>.loading();
    var body = {"full_name": fullName, "email": email, "password": password};
    registerResponse.value = await AuthRepo.register(body);
    return registerResponse.value;
  }
}
