import 'package:get/get.dart';

import '../controllers/create_member_controller.dart';

class CreateMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMemberController>(
      () => CreateMemberController(),
    );
  }
}
