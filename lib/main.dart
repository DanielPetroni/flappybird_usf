import 'package:flappybird_usf/app/modules/home/home_page.dart';
import 'package:flappybird_usf/app/routes/name_routes.dart';
import 'package:flappybird_usf/app/routes/routes.dart';
import 'package:flappybird_usf/app/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlappyBird Usf',
      theme: ThemeApp.themeData,
      getPages: RoutesApp.pages,
      initialRoute: NameRoutesApp.home,
    );
  }
}
