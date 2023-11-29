import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/api/api_urls.dart';
import 'package:adventure_nepal/app/modules/home/model/activities_response.dart';
import 'package:adventure_nepal/app/utils/extensions.dart';

class ActivitiesRepo {
  static Future<ApiResponse<ActivitiesResponse>> getActivities(
      int userId, String weather) async {
    String url = "${ApiUrls.getAllActivities}?user_id=$userId";
    if (!weather.isNullOrEmpty) {
      url = "$url&weather=$weather";
    }
    final response = await ApiClient.getApi<ActivitiesResponse>(
      url,
      isTokenRequired: false,
      fromJson: (json) => ActivitiesResponse.fromJson(json),
    );
    return response;
  }
}
