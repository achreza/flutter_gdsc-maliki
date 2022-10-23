import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: "GDSC Maliki",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  print('starting services...');
  await Get.putAsync(() => MemberService().init());
  print('All services started...');
}
