import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../services/location_service.dart';

class LocationProvider with ChangeNotifier {
  final LocationService locationService;

  LocationProvider({required this.locationService});

  Future<LocationData?> getCurrentLocation() async {
    try {
      final locationData = await locationService.getCurrentLocation();
      notifyListeners();
      return locationData;
    } catch (error) {
      rethrow;
    }
  }
}
