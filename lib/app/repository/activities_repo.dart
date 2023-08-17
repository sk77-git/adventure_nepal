import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/home/model/activities_response.dart';

class ActivitiesRepo {
  static Future<ApiResponse<ActivitiesResponse>> getActivities() async {
    final response = await ApiClient.getApi<ActivitiesResponse>(
      "http://10.0.2.2/adv_nepal/api/get_all_activities.php",
      isTokenRequired: false,
      fromJson: (json) => ActivitiesResponse.fromJson(json),
    );
    return response;
  }
}
