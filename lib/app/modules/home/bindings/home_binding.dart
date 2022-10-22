import 'package:flutter_gdscmaliki/app/data/providers/member_provider.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberProvider>(() => MemberProvider());
    Get.lazyPut<MemberService>(() => MemberService());
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
