import 'package:location/location.dart';

class LocationService {
  final Location location = Location();

  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw 'Location service is disabled.';
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw 'Location permission is denied.';
      }
    }

    locationData = await location.getLocation();
    return locationData;
  }
}
