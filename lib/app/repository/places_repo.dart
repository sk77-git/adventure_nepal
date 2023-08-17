import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/home/model/place_response.dart';

class PlacesRepo {
  static Future<ApiResponse<PlacesResponse>> getPlaces() async {
    final response = await ApiClient.getApi<PlacesResponse>(
      "http://10.0.2.2/adv_nepal/api/get_all_places.php",
      isTokenRequired: false,
      fromJson: (json) => PlacesResponse.fromJson(json),
    );
    return response;
  }
}
