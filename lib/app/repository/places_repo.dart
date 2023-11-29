import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/api/api_urls.dart';
import 'package:adventure_nepal/app/modules/home/model/place_response.dart';
import 'package:adventure_nepal/app/utils/extensions.dart';

class PlacesRepo {
  static Future<ApiResponse<PlacesResponse>> getPlaces(
      int userId, double? latitude, double? longitude, String weather) async {
    String url =
        "${ApiUrls.getAllPlaces}?lat=${latitude ?? 27}&long=${longitude ?? 85}&user_id=$userId";
    if (!weather.isNullOrEmpty) {
      url = "$url&weather=$weather";
    }
    final response = await ApiClient.getApi<PlacesResponse>(
      url,
      isTokenRequired: false,
      fromJson: (json) => PlacesResponse.fromJson(json),
    );
    return response;
  }
}
