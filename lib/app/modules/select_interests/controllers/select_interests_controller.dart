import 'dart:convert';

import 'package:adventure_nepal/app/modules/select_interests/models/user_interests_response.dart';
import 'package:adventure_nepal/app/repository/user_repo.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../data/basic_api_response.dart';

class SelectInterestsController extends GetxController {
  var storeUserInterestsResponse = ApiResponse<BasicApiResponse>.initial().obs;
  var userInterestsResponse = ApiResponse<UserInterestsResponse>.initial().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<ApiResponse<BasicApiResponse>> storeInterests(
      int userId, List<String> interests) async {
    storeUserInterestsResponse.value = ApiResponse<BasicApiResponse>.loading();
    var body = {"id": userId.toString(), "interests": jsonEncode(interests)};
    storeUserInterestsResponse.value = await UserRepo.storeUserInterests(body);
    return storeUserInterestsResponse.value;
  }

  Future<ApiResponse<UserInterestsResponse>> getUserInterests(
      int userId) async {
    userInterestsResponse.value = ApiResponse<UserInterestsResponse>.loading();
    userInterestsResponse.value = await UserRepo.getInterests(userId);
    return userInterestsResponse.value;
  }
}
