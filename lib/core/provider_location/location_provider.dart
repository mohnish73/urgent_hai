import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
 import 'package:http/http.dart' as http;


class LocationProvider extends ChangeNotifier {
  double? latitude;
  double? longitude;
  String? address;
  String? addressForLocationCard;
  bool isLoading = false;

  /// Your Google Maps Geocoding API Key
  final String googleMapsApiKey = 'AIzaSyArJ8bQTUnA2zLyHb1xbKBV07yOveRhu3U';

  Future<void> fetchCurrentLocation() async {
    try {
      isLoading = true;
      notifyListeners();

      // Check permission (only needed for non-web)
      if (!kIsWeb) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            isLoading = false;
            notifyListeners();
            // throw Exception('Location permission denied');
          }
        }
      }

      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      // Reverse geocoding
      if (kIsWeb) {
        // Use Google Maps API for web
        address = await _getAddressFromGoogleAPI(latitude!, longitude!);
      } else {
        // Use native geocoding for Android/iOS
        List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          // address = '${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
          address = '${place.name}, ${place.locality},\n ${place.country}';
          addressForLocationCard = '${place.name}, ${place.locality}, ${place.country}';
        }
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Error fetching location: $e');
    }
  }

  Future<String?> _getAddressFromGoogleAPI(double lat, double lng) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleMapsApiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          return data['results'][0]['formatted_address'];
        }
      }
      return 'Lat: $lat, Lng: $lng'; // fallback
    } catch (e) {
      print('Google API error: $e');
      return 'Lat: $lat, Lng: $lng';
    }
  }

  // void shareLocation() {
  //   if (latitude != null && longitude != null) {
  //     String locationUrl = "https://maps.google.com/?q=$latitude,$longitude";
  //     Share.share("Here is my current location: $locationUrl");
  //   } else {
  //     Share.share("Location not available yet.");
  //   }
  // }

}
