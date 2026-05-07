import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gis/ui/map_screen.dart';
import 'package:gis/ui/navigation/routes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  LocationPermission? permissionStatus;

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  Future<void> requestPermission() async {
    setState(() {
      Geolocator.checkPermission().then((status) {
        permissionStatus = status;
        if (permissionStatus == LocationPermission.denied) {
          Geolocator.requestPermission().then((_) => requestPermission());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('2Gis demo'), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text('Open map'),
            ElevatedButton(
              onPressed: permissionStatus == LocationPermission.whileInUse || permissionStatus == LocationPermission.always
                  ? () => Get.toNamed(Routes.map.routeName)
                  : null,
              child: Text('using GetX navigator'),
            ),
            ElevatedButton(
              onPressed: permissionStatus == LocationPermission.whileInUse || permissionStatus == LocationPermission.always
                  ? () => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const MapScreen()))
                  : null,
              child: Text('using Flutter navigator'),
            ),
            Text(
              permissionStatus?.name ?? 'Location permission undetermined',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: permissionStatus == LocationPermission.whileInUse || permissionStatus == LocationPermission.always ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
