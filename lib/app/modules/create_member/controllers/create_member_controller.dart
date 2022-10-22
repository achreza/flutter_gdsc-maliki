import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/create_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class CreateMemberController extends GetxController {
  //TODO: Implement CreateMemberController

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

      final dto = CreateMemberRequest(
        nama: nama.value,
        nim: int.parse(nim.value),
        role: role.value,
        bidang: bidang.value,
      );

      try {
        await memberService.createOrder(dto);
        Get.back();
        homeController.fetchAllMembers();
      } catch (e) {
        print(e.toString());
        Get.log(e.toString());
      } finally {
        Get.snackbar(
            'Berhasil Submit', 'Data member baru berhasil ditambahkan');
        isSubmit.value = false;
      }
    }
  }
}
