import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../theme/app_strings.dart';
import 'api_urls.dart';
import 'http_client.dart';

///This class is used to communicate with APIs
class ApiClient {
  static Future<ApiResponse<T>> getApi<T>(
    String url, {
    required bool isTokenRequired,
    T Function(dynamic json)? fromJson,
  }) async {
    var header = {
      "Accept": "application/json",
    };
    final response =
        await MyHttpClient.client.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = fromJson != null ? fromJson(json) : json as T;
      if (json["status"] == "success" || url.contains("api.weatherapi.com")) {
        return ApiResponse.completed(data);
      } else {
        return ApiResponse.error(json["message"] ?? "Something went wrong");
      }
    } else {
      final message = ApiMessage.getMessage(response.statusCode, response.body);
      log("Api Client:$url:$message");
      return ApiResponse.error(message);
    }
    /*try {
      final response = await MyHttpClient.client
          .get(Uri.parse(url), headers: header);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final data = fromJson != null ? fromJson(json) : json as T;
        return ApiResponse.completed(data);
      } else {
        final message =
        ApiMessage.getMessage(response.statusCode, response.body);
        log("Api Client:$url:$message");
        return ApiResponse.error(message);
      }
    } on SocketException {
      log("Api Client:$url:No internet connection");
      return ApiResponse.error("Could not connect to server");
    } catch (e) {
      log("Api Client:Error Parsing Data: $e for endpoint:$url");
      return ApiResponse.error("Error Parsing Data");
    }*/
  }

  static Future<ApiResponse<T>> postApi<T>(
    String endPoint, {
    required Map<String, dynamic> requestBody,
    T Function(dynamic json)? responseType,
    required bool isTokenRequired,
  }) async {
    var header = {
      "Accept": "application/json",
    };
    try {
      final response = await MyHttpClient.client.post(
          Uri.parse(ApiUrls.baseUrl + endPoint),
          body: requestBody,
          headers: header);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final data = responseType != null ? responseType(json) : json as T;
        if (json["status"] == "success") {
          return ApiResponse.completed(data);
        } else {
          return ApiResponse.error(json["message"] ?? "Something went wrong");
        }
      } else {
        final message =
            ApiMessage.getMessage(response.statusCode, response.body);
        log("Api Client:$endPoint:$message");
        return ApiResponse.error(message);
      }
    } on SocketException {
      log("Api Client:$endPoint:No internet connection");
      return ApiResponse.error("Could not connect to server");
    } catch (e) {
      log("Api Client:Error Parsing Data: $e for endpoint:$endPoint");
      return ApiResponse.error("Error Parsing Data");
    }
  }
}

class ApiResponse<T> {
  ApiStatus status;
  T? response;
  String? message;

  ApiResponse.initial([this.message])
      : status = ApiStatus.INITIAL,
        response = null;

  ApiResponse.loading([this.message])
      : status = ApiStatus.LOADING,
        response = null;

  ApiResponse.completed(this.response)
      : status = ApiStatus.SUCCESS,
        message = null;

  ApiResponse.error([this.message])
      : status = ApiStatus.ERROR,
        response = null;

  @override
  String toString() {
    return "Status : $status \nData : $response \nMessage : $message";
  }
}

class ApiMessage {
  static String getMessage(int statusCode, String response) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return AppStrings.unAuthorised;
      case 403:
        return AppStrings.forbidden;
      case 404:
        return AppStrings.notFound;
      case 417:
        return AppStrings.expectationFailed;
      case 500:
        return AppStrings.badRequest;
      case 502:
        return AppStrings.serverError;
      default:
        return 'Error getting data. Error Code: $statusCode';
    }
  }
}

enum ApiStatus { INITIAL, LOADING, SUCCESS, ERROR }

class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => "ApiException: $message";
}
