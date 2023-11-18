import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/api/api_urls.dart';
import 'package:adventure_nepal/app/modules/home/model/activities_response.dart';

class ActivitiesRepo {
  static Future<ApiResponse<ActivitiesResponse>> getActivities() async {
    final response = await ApiClient.getApi<ActivitiesResponse>(
      ApiUrls.getAllActivities,
      isTokenRequired: false,
      fromJson: (json) => ActivitiesResponse.fromJson(json),
    );
    return response;
  }
}
