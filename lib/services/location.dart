import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Step 1: Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return;
      }

      // Step 2: Check and request permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permission denied.');
          return;
        }
      }

      // Step 3: Handle permanently denied permission
      if (permission == LocationPermission.deniedForever) {
        print('Permission denied permanently. Please enable it from settings.');
        await Geolocator.openAppSettings();
        return;
      }

      // Step 4: Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;

      // Step 5: Print location to console
      print('Location: $latitude, $longitude');
    } catch (e) {
      print('Failed to get location: $e');
    }
  }
}
