import 'package:dgis_mobile_sdk_map/dgis.dart' as sdk;
import 'package:get/get.dart';
import 'package:gis/ui/map/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(
        sdk.DGis.initialize(
          logOptions: const sdk.LogOptions(customLevel: sdk.LogLevel.verbose, systemLevel: sdk.LogLevel.verbose),
        ),
      )
      ..put(MapController(gisContext: Get.find()));
  }
}
