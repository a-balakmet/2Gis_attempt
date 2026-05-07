import 'package:get/get.dart';
import 'package:gis/ui/map/map_binding.dart';
import 'package:gis/ui/map/map_page.dart';
import 'package:gis/ui/navigation/routes.dart';
import 'package:gis/ui/start_screen.dart';

class Pages {

  static final pages = [
    GetPage(name: Routes.start.routeName, page: () => StartScreen()),
    GetPage(name: Routes.map.routeName, page: () => MapPage(), binding: MapBinding()),
  ];
}