import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';
import '../controllers/edit_member_controller.dart';

class EditMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<EditMemberController>(
      () => EditMemberController(),
    );
  }
}
