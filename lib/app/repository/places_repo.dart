import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/api/api_urls.dart';
import 'package:adventure_nepal/app/modules/home/model/place_response.dart';

class PlacesRepo {
  static Future<ApiResponse<PlacesResponse>> getPlaces() async {
    final response = await ApiClient.getApi<PlacesResponse>(
      ApiUrls.getAllPlaces,
      isTokenRequired: false,
      fromJson: (json) => PlacesResponse.fromJson(json),
    );
    return response;
  }
}
