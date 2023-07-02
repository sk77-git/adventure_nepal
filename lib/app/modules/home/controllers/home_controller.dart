import 'dart:developer';

import 'package:adventure_nepal/app/repository/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../api/api_client.dart';
import '../../../theme/app_colors.dart';
import '../model/weather_response.dart';
import 'package:geolocator/geolocator.dart';


class HomeController extends GetxController {

  final  isLoading= true.obs;
  final  isLocationSaved= false.obs;
  //final weatherResponse= <WeatherResponse>[];

  var weatherResponse = ApiResponse<WeatherResponse>.initial().obs;

  String? _currentAddress;
  Position? _currentPosition;
  var searchTextFieldController= TextEditingController();
  @override
  void onInit() {
    super.onInit();
    _getCurrentPosition();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  /*void getWeather(String location) async {
    isLoading.value = true;
    var data = await Api().fetchWeather(location);
    log("getWeather:$data");
    if (data != null) {
      weatherResponse.clear();
      weatherResponse.add( WeatherResponse.fromJson(data));
    }
    isLoading.value = false;
  }*/



  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      /*If problem in permission show weather of Kathmandu temporarily*/
      getWeather("Kathmandu");
      return;
    }
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      /*If location got, then get weather by lat lang*/
      getWeather("${_currentPosition?.latitude},${_currentPosition?.longitude}");
      // _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  /*To check if required permission are available*/
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("GPS not turned ON", "Location services are disabled. Please enable the services and refresh the page.",snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.whiteGrey);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied", "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission Denied, Search Location Manually", "Location permissions are permanently denied, we cannot request permissions.", snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.whiteGrey);
      return false;
    }
    return true;
  }

  Future<void> getWeather(String location) async {
    weatherResponse.value = ApiResponse<WeatherResponse>.loading();
    final response = await MainRepo.getWeather(location);
    weatherResponse.value = response;
  }
}
