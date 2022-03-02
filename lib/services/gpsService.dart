//filename: ./service/location_service.dart
import 'dart:async';
import 'geoLocationService.dart';
import 'package:location/location.dart';

class LocationService {

  Location location = new Location();


  bool _serviceEnabled = false;
  late PermissionStatus _permissionGranted;

  Future getCurrentLocation() async {
    final completer = Completer();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        completer.completeError('Gps off');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        completer.completeError('gps Permission Denied');
      }
    }

    LocationData locationData = await location.getLocation();
     completer.complete([locationData.longitude,locationData.latitude]);
    return completer.future;
  }





}