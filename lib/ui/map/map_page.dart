import 'package:dgis_mobile_sdk_map/dgis.dart' as sdk;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'map_controller.dart';

class MapPage extends GetView<MapController> {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Column(
        children: [
          Text('Map view'),
          Text('GetX navigation', style: Theme.of(context).textTheme.bodySmall)
        ],
      )),
      body: Obx(() {
        return sdk.MapWidget(
          sdkContext: controller.gisContext,
          mapOptions: sdk.MapOptions(position: controller.position.value),
          // controller: controller.mapController,
        );
      }),
    );
  }
}
