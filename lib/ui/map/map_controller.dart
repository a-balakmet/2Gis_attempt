import 'dart:developer';

import 'package:dgis_mobile_sdk_map/dgis.dart' as sdk;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  final sdk.Context gisContext;

  MapController({required this.gisContext});

  final position = Rx<sdk.CameraPosition>(
    sdk.CameraPosition(
      point: sdk.GeoPoint(latitude: sdk.Latitude(43.236535), longitude: sdk.Longitude(76.911823)),
      zoom: sdk.Zoom(15),
    ),
  );

  sdk.MapWidgetController mapController = sdk.MapWidgetController();

  @override
  void onInit() {
    initLocation();
    super.onInit();
  }

  Future<void> initLocation() async {
    final location = await Geolocator.getCurrentPosition();
    log('Current location: $location');
    position(
      sdk.CameraPosition(
        point: sdk.GeoPoint(latitude: sdk.Latitude(location.latitude), longitude: sdk.Longitude(location.longitude)),
        zoom: sdk.Zoom(15),
      ),
    );
  }
}
