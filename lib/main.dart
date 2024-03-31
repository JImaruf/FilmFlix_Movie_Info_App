import 'package:filmflix/controller/home_controller.dart';
import 'package:filmflix/pages/home_page.dart';
import 'package:filmflix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FilmFlix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colourss.scaffoldBGcolor
      ),

      home:  HomePage(),
    );
  }
}


