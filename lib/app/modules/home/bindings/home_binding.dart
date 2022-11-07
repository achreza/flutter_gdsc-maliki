import 'package:flutter_gdscmaliki/app/data/providers/event_provider.dart';
import 'package:flutter_gdscmaliki/app/data/providers/member_provider.dart';
import 'package:flutter_gdscmaliki/app/data/services/event_service.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberProvider>(() => MemberProvider());
    Get.lazyPut<MemberService>(() => MemberService());
    Get.lazyPut<EventProvider>(() => EventProvider());
    Get.lazyPut<EventService>(() => EventService());
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
