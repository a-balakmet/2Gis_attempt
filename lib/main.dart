import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gis/ui/navigation/routes.dart';
import 'package:gis/ui/start_screen.dart';

import 'ui/navigation/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.start.routeName,
      getPages: Pages.pages,
      home: StartScreen(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: PopScope(canPop: false, child: child!),
      ),
    );
  }
}
