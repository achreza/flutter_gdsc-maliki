import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/components/cards/detail_member.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

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

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Ya"),
      onPressed: () async {
        await FirebaseAuth.instance
            .signOut()
            .then((_) => Get.snackbar('System Alert', 'Anda Telah Logout'));
        Get.offAllNamed(Routes.LOGIN)!;
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Apa anda yakin ingin Log out dari Aplikasi ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void navigateToCreateMember() {
    Get.toNamed('/create-member');
  }

  void navigateToEditMember(Data member) {
    Get.toNamed('/edit-member', arguments: member);
  }

  void bottomDetail(Data member) {
    Color backgroundFoto = member.role == 'Lead'
        ? Colors.blue
        : member.role == 'Core Team'
            ? Colors.red
            : member.role == 'Association Core'
                ? Colors.green
                : Colors.grey;

    final GlobalKey<FormState> memberFormKey = GlobalKey<FormState>();
    Get.bottomSheet(
      DetailMemberView(
        member: member,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
