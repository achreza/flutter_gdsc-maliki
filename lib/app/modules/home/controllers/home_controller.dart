import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/components/cards/detail_member.dart';
import 'package:flutter_gdscmaliki/app/data/models/event_model.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/models/profile.dart';
import 'package:flutter_gdscmaliki/app/data/services/event_service.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/home/views/event_view.dart';
import 'package:flutter_gdscmaliki/app/modules/home/views/home_view.dart';
import 'package:flutter_gdscmaliki/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController

  final RxList<Data> members = RxList();
  final RxList<EventData> events = RxList();

  final RxBool isFetchingMember = true.obs;
  final RxBool isFetchingEvent = true.obs;
  final MemberService memberService = Get.find<MemberService>();
  final EventService eventService = Get.find<EventService>();
  final UserProfile userProfile = Get.arguments;

  final List<Widget> pages = [
    HomeView(),
    EventView(),
    EventView(),
  ];

  final RxInt tabIndex = 0.obs;
  late TabController tabController;

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onInit() {
    tabController = TabController(length: pages.length, vsync: this);
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

  void fetchAllEvents() async {
    isFetchingEvent.value = true;

    try {
      Get.log('fetching Events on Progress');
      final events = await eventService.getAllEvents();
      this.events.value = events.data;
      Get.log('fetching Events success');
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
    } finally {
      isFetchingEvent.value = false;
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
