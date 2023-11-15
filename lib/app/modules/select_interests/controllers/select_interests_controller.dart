import 'package:adventure_nepal/app/repository/user_repo.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../data/basic_api_response.dart';

class SelectInterestsController extends GetxController {
  var changePasswordResponse = ApiResponse<BasicApiResponse>.initial().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<ApiResponse<BasicApiResponse>> storeInterests(
      int userId, List<String> interests) async {
    changePasswordResponse.value = ApiResponse<BasicApiResponse>.loading();
    var body = {
      "id": userId.toString(),
      "interests": interests.toList().toString()
    };
    changePasswordResponse.value = await UserRepo.storeUserInterests(body);
    return changePasswordResponse.value;
  }
}
