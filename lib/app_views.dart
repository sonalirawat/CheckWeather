import 'package:check_wheather/app_routes.dart';
import 'package:check_wheather/home_page/home_page_binding.dart';
import 'package:check_wheather/home_page/home_page_view.dart';
import 'package:get/get.dart';

class AppViews {

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () =>   HomePage(), binding: HomePageBinding())

  ];
}