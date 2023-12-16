import 'dart:async';

import 'package:geolocator/geolocator.dart';

final class LocationRepository {
  LocationRepository() {
    serviceStatusStream = Geolocator.getServiceStatusStream();
  }

  late final Stream<ServiceStatus> serviceStatusStream;

  bool isPermissionAllowed(LocationPermission permission) =>
      permission != LocationPermission.denied && permission != LocationPermission.deniedForever;

  Future<void> openAppSettings() async => await Geolocator.openAppSettings();

  Future<void> openLocationSettings() async => await Geolocator.openLocationSettings();

  Future<bool> checkPermissions() async {
    final permission = await Geolocator.checkPermission();
    return isPermissionAllowed(permission);
  }

  Future<LocationPermission> requestPermissions() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {
      if (permission == LocationPermission.deniedForever) {
        await openAppSettings();
      }
    }
    return permission;
  }

  Future<Position> determinePosition() async {
    return await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
      desiredAccuracy: LocationAccuracy.low,
    );
  }
}
