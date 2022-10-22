import 'package:dio/dio.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxList<Data> members = RxList();

  final RxBool isFetchingMember = true.obs;
  final MemberService memberService = Get.find<MemberService>();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchAllMembers() async {
    isFetchingMember.value = true;

    try {
      Get.log('fetching members on Progress');
      final members = await memberService.getAllMembers();
      this.members.value = members.data;
      Get.log('fetching members success');
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
    } finally {
      isFetchingMember.value = false;
    }
  }

  void navigateToCreateMember() {
    Get.toNamed('/create-member');
  }
}
