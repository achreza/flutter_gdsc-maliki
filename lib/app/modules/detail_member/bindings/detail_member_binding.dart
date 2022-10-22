import 'package:get/get.dart';

import '../controllers/detail_member_controller.dart';

class DetailMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMemberController>(
      () => DetailMemberController(),
    );
  }
}
