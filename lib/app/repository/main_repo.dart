import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/home/model/weather_response.dart';

import '../api/api_urls.dart';

class MainRepo {
  static Future<ApiResponse<WeatherResponse>> getWeather(String location) async {
    final response = await ApiClient.getApi<WeatherResponse>(
      "http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=$location",
      isTokenRequired: false,
      fromJson: (json) => WeatherResponse.fromJson(json),
    );
    return response;
  }
}