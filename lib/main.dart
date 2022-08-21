import 'package:cloud_storage/core/bindings/initial_bindings.dart';
import 'package:cloud_storage/core/config/analytics_error.dart';
import 'package:cloud_storage/core/routes/routes_config.dart';
import 'package:cloud_storage/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await AnalyticsError().zoneGuarded(() async {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      getPages: RoutesConfig().getPages(),
      title: 'Cloud Storage',
      theme: AppTheme().themeDefault,
      initialRoute: "/",
    );
  }
}
