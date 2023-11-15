import '../api/api_client.dart';
import '../api/api_urls.dart';
import '../data/basic_api_response.dart';

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
}
