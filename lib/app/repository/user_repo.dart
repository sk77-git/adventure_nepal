import '../api/api_client.dart';
import '../api/api_urls.dart';
import '../data/basic_api_response.dart';
import '../modules/select_interests/models/user_interests_response.dart';

class UserRepo {
  static Future<ApiResponse<BasicApiResponse>> storeUserInterests(
      dynamic storeUserInterestsRequest) async {
    final response = await ApiClient.postApi<BasicApiResponse>(
      ApiUrls.storeInterests,
      isTokenRequired: false,
      requestBody: storeUserInterestsRequest,
      responseType: (json) => BasicApiResponse.fromJson(json),
    );
    return response;
  }

  static Future<ApiResponse<UserInterestsResponse>> getInterests(
      int userId) async {
    final response = await ApiClient.getApi<UserInterestsResponse>(
      "${ApiUrls.getInterests}?user_id=$userId",
      isTokenRequired: false,
      fromJson: (json) => UserInterestsResponse.fromJson(json),
    );
    return response;
  }
}
