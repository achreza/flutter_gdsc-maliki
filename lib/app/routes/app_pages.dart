import 'package:get/get.dart';

import 'package:flutter_gdscmaliki/app/modules/create_member/bindings/create_member_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/create_member/views/create_member_view.dart';
import 'package:flutter_gdscmaliki/app/modules/edit_member/bindings/edit_member_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/edit_member/views/edit_member_view.dart';
import 'package:flutter_gdscmaliki/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/home/views/home_view.dart';
import 'package:flutter_gdscmaliki/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/login/views/login_view.dart';
import 'package:flutter_gdscmaliki/app/modules/register/bindings/register_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/register/views/register_view.dart';
import 'package:flutter_gdscmaliki/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_gdscmaliki/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_MEMBER,
      page: () => CreateMemberView(),
      binding: CreateMemberBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MEMBER,
      page: () => EditMemberView(),
      binding: EditMemberBinding(),
    ),
  ];
}
