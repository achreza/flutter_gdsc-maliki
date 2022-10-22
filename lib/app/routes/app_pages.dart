import 'package:get/get.dart';

import 'package:flutter_gdscmaliki/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/home/views/home_view.dart';
import 'package:flutter_gdscmaliki/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/login/views/login_view.dart';
import 'package:flutter_gdscmaliki/app/modules/register/bindings/register_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
