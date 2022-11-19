import 'package:flappybird_usf/app/modules/home/home_binding.dart';
import 'package:flappybird_usf/app/modules/home/home_page.dart';
import 'package:flappybird_usf/app/routes/name_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class RoutesApp {
  static List<GetPage<dynamic>> pages = [
    GetPage(
        name: NameRoutesApp.home,
        page: () => const HomePage(),
        binding: HomeBinding())
  ];
}
