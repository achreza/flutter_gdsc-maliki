import 'package:flutter_gdscmaliki/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/create_member_controller.dart';

class CreateMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<CreateMemberController>(
      () => CreateMemberController(),
    );
  }
}
