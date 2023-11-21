import '../api/api_client.dart';
import '../api/api_urls.dart';
import '../data/basic_api_response.dart';
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

  static Future<ApiResponse<BasicApiResponse>> register(
      dynamic signupRequest) async {
    final response = await ApiClient.postApi<BasicApiResponse>(
      ApiUrls.register,
      isTokenRequired: false,
      requestBody: signupRequest,
      responseType: (json) => BasicApiResponse.fromJson(json),
    );
    return response;
  }

  static Future<ApiResponse<BasicApiResponse>> verifyOtp(
      dynamic otpVerifyRequest) async {
    final response = await ApiClient.postApi<BasicApiResponse>(
      ApiUrls.verifyOtp,
      isTokenRequired: false,
      requestBody: otpVerifyRequest,
      responseType: (json) => BasicApiResponse.fromJson(json),
    );
    return response;
  }

  static Future<ApiResponse<BasicApiResponse>> forgotPassword(
      dynamic forgotPasswordRequest) async {
    final response = await ApiClient.postApi<BasicApiResponse>(
      ApiUrls.forgotPassword,
      isTokenRequired: false,
      requestBody: forgotPasswordRequest,
      responseType: (json) => BasicApiResponse.fromJson(json),
    );
    return response;
  }

  static Future<ApiResponse<BasicApiResponse>> changePassword(
      dynamic changePasswordRequest) async {
    final response = await ApiClient.postApi<BasicApiResponse>(
      ApiUrls.changePassword,
      isTokenRequired: false,
      requestBody: changePasswordRequest,
      responseType: (json) => BasicApiResponse.fromJson(json),
    );
    return response;
  }
}
