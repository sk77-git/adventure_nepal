import 'dart:async';

import 'package:adventure_nepal/app/modules/home/model/activities_response.dart';
import 'package:adventure_nepal/app/modules/home/model/place_response.dart';
import 'package:adventure_nepal/app/repository/activities_repo.dart';
import 'package:adventure_nepal/app/repository/main_repo.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../repository/places_repo.dart';
import '../../../theme/app_colors.dart';
import '../model/weather_response.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final isLocationSaved = false.obs;

  //final weatherResponse= <WeatherResponse>[];

  var weatherResponse = ApiResponse<WeatherResponse>.initial().obs;
  var placesResponse = ApiResponse<PlacesResponse>.initial().obs;
  List<Place> places = [];
  var activitiesResponse = ApiResponse<ActivitiesResponse>.initial().obs;
  List<Activity> activities = [];

  String? _currentAddress;
  Position? _currentPosition;
  var searchTextFieldController = TextEditingController();
  var greeting = "Good Morning!".obs;

  @override
  void onInit() {
    super.onInit();
    updateGreeting();
    _getCurrentPosition().then((value) {
      _getPlaces(
          StorageUtil.getUserId(),
          _currentPosition?.latitude,
          _currentPosition?.longitude,
          weatherResponse.value.response?.current?.condition?.text ?? "");
      _getActivities(StorageUtil.getUserId(),
          weatherResponse.value.response?.current?.condition?.text ?? "");
    });
  }

  void updateGreeting() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    if (currentHour >= 0 && currentHour < 12) {
      greeting.value = 'Good Morning!';
    } else if (currentHour >= 12 && currentHour < 17) {
      greeting.value = 'Good Afternoon!';
    } else {
      greeting.value = 'Good Evening!';
    }
    Timer(const Duration(minutes: 1), updateGreeting);
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      /*If problem in permission show weather of Kathmandu initially*/
      await getWeather("Kathmandu");
      return;
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      /*If location got, then get weather by lat lang*/
      getWeather(
          "${_currentPosition?.latitude},${_currentPosition?.longitude}");
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
      Get.snackbar("GPS not turned ON",
          "Location services are disabled. Please enable the services and refresh the page.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.whiteGrey);
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
      Get.snackbar("Permission Denied, Search Location Manually",
          "Location permissions are permanently denied, we cannot request permissions.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.whiteGrey);
      return false;
    }
    return true;
  }

  Future<void> getWeather(String location) async {
    weatherResponse.value = ApiResponse<WeatherResponse>.loading();
    final response = await MainRepo.getWeather(location);
    weatherResponse.value = response;
  }

  Future<void> _getPlaces(
      int userId, double? latitude, double? longitude, String weather) async {
    placesResponse.value = ApiResponse<PlacesResponse>.loading();
    placesResponse.value =
        await PlacesRepo.getPlaces(userId, latitude, longitude, weather);
    places = placesResponse.value.response?.places ?? [];
  }

  Future<void> _getActivities(int userId, String weather) async {
    activitiesResponse.value = ApiResponse<ActivitiesResponse>.loading();
    activitiesResponse.value =
        await ActivitiesRepo.getActivities(userId, weather);
    activities = activitiesResponse.value.response?.activities ?? [];
  }
}
