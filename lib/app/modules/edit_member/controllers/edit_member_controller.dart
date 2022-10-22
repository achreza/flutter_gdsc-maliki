import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/update_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      isSubmit.value = true;

      final dto = updateMemberRequest(
        nama: nama.value,
        nim: int.parse(nim.value),
        role: role.value,
        bidang: bidang.value,
      );

      final id = data.id!;

      try {
        await memberService.updateOrder(id, dto);
        homeController.fetchAllMembers();
        Get.offNamedUntil('/home', ModalRoute.withName('/home'));
        Get.snackbar('Update Success', 'Order berhasil diubah');
      } catch (e) {
        Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
      } finally {
        isSubmit.value = false;
      }
    }
  }
}
