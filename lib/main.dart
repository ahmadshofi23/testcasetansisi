import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testcasepttransisi/app/style/colors.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: ColorApps.kPrimaryColor,
      )),
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
