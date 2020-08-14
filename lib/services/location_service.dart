import 'package:location/location.dart';
import 'package:flutter/services.dart';

class LocationService {
  var locationService = Location();

  Future<LocationData> getLocation() async {
    try {
      bool serviceIsEnabled = await isServiceEnabled();
      if (!serviceIsEnabled) return null;

      bool permissionIsGranted = await isPermissionGranted();
      if (!permissionIsGranted) return null;

      return await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      return null;
    }
  }

  Future<bool> isServiceEnabled() async {
    var _serviceEnabled = await locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationService.requestService();
      if (!_serviceEnabled) {
        print('Failed to enable service. Returning.');
        return false;
      }
    }
    return true;
  }

  Future<bool> isPermissionGranted() async {
    var _permissionGranted = await locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        print('Location service permission not granted. Returning.');
        return false;
      }
    }
    return true;
  }
}
