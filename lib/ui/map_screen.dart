import 'package:dgis_mobile_sdk_map/dgis.dart' as sdk;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  sdk.Context? gisContext;
  sdk.CameraPosition position = sdk.CameraPosition(
    point: sdk.GeoPoint(latitude: sdk.Latitude(43.236535), longitude: sdk.Longitude(76.911823)),
    zoom: sdk.Zoom(15),
  );

  @override
  void initState() {
    gisContext = sdk.DGis.initialize(
      logOptions: const sdk.LogOptions(customLevel: sdk.LogLevel.verbose, systemLevel: sdk.LogLevel.verbose),
    );
    getActualPosition().then((value) {
      setState(() {
        position = sdk.CameraPosition(
          point: sdk.GeoPoint(latitude: sdk.Latitude(value.latitude), longitude: sdk.Longitude(value.longitude)),
          zoom: sdk.Zoom(15),
        );
      });
    });
    super.initState();
  }

  Future<Position> getActualPosition() async => Geolocator.getCurrentPosition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Map view'),
            Text('Flutter navigation', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      body: gisContext == null
          ? Center(child: Text('Map context is not initialized'))
          : sdk.MapWidget(
              sdkContext: gisContext!,
              mapOptions: sdk.MapOptions(position: position),
              // controller: mapController,
            ),
    );
  }
}
