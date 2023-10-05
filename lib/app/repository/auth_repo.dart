import '../api/api_client.dart';
import '../api/api_urls.dart';
import '../modules/login/model/login_response.dart';

class AuthRepo {
  static Future<ApiResponse<LoginResponse>> login(dynamic loginRequest) async {
    final response = await ApiClient.postApi<LoginResponse>(
      ApiUrls.login,
      isTokenRequired: false,
      requestBody: loginRequest,
      responseType: (json) => LoginResponse.fromJson(json),
    );
    return response;
  }
}
