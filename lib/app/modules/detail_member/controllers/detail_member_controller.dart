import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:get/get.dart';

class DetailMemberController extends GetxController {
  //TODO: Implement DetailMemberController

  Data member = Get.arguments;

  void navigateToEditMember() {
    Get.toNamed('/edit-member', arguments: member);
  }
}
