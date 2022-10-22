import 'package:get/get.dart';

import '../controllers/edit_member_controller.dart';

class EditMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMemberController>(
      () => EditMemberController(),
    );
  }
}
