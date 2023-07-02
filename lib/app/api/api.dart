import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class Api {
  Future fetchWeather(location) async {
    var response = await http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=$location"));
    log("fetchWeather:${response.body}");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
