import 'package:check_wheather/app_routes.dart';
import 'package:check_wheather/app_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home,
      getPages: AppViews.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


