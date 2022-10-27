import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/update_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/models/profile.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';
import 'package:get/get.dart';

class EditMemberController extends GetxController {
  //TODO: Implement EditMemberController

  Data data = Get.arguments;

  final MemberService memberService = Get.find();
  final HomeController homeController = Get.find();
  final RxBool isSubmit = false.obs;

  final RxString nama = ''.obs;
  final RxString nim = ''.obs;
  final RxString role = ''.obs;
  final RxString bidang = ''.obs;

  final TextEditingController? pilihanRole = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    nama.value = data.nama.toString();
    nim.value = data.nim.toString();
    role.value = pilihanRole!.text.toString();
    bidang.value = data.bidang.toString();
    super.onInit();
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      isSubmit.value = true;

      final dto = updateMemberRequest(
        nama: nama.value,
        nim: int.parse(nim.value),
        role: pilihanRole!.text.toString(),
        bidang: bidang.value,
      );

      final id = data.id!;

      try {
        await memberService.updateMember(id, dto);
        homeController.fetchAllMembers();
        Get.back();
        Get.snackbar('Update Success', 'Order berhasil diubah',
            backgroundColor: primaryColor, colorText: Colors.white);
      } catch (e) {
        Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
      } finally {
        isSubmit.value = false;
      }
    }
  }
}
