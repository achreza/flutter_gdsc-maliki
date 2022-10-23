import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMemberView extends StatelessWidget {
  DetailMemberView({
    Key? key,
    required this.member,
  }) : super(key: key);

  final MemberService memberService = Get.find();
  final HomeController homeController = Get.find();

  final Data member;

  Future<void> deleteMember() async {
    final id = member.id!;

    try {
      await memberService.deleteMember(id);
      homeController.fetchAllMembers();
      Get.offAllNamed('/home');
      Get.snackbar('Delete Success',
          'Member dengan Nama : ${member.nama} berhasil dihapus',
          backgroundColor: primaryColor, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundFoto = member.role == 'Lead'
        ? Colors.blue
        : member.role == 'Core Team'
            ? Colors.red
            : member.role == 'Association Core'
                ? Colors.green
                : Colors.grey;

    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Event Diikuti',
                            style: GoogleFonts.montserrat(
                                fontSize: 12, color: Colors.grey)),
                        Text('12',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    CircleAvatar(
                        radius: 40,
                        backgroundColor: backgroundFoto,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        )),
                    Column(
                      children: [
                        Text('kontribusi Event',
                            style: GoogleFonts.montserrat(
                                fontSize: 12, color: Colors.grey)),
                        Text('1',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Center(
              child: Text(
                member.nama.toString(),
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              member.nim.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Text(
              member.bidang.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              member.role.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: backgroundFoto),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        Get.toNamed(Routes.EDIT_MEMBER, arguments: member),
                    child: Text('Edit Data')),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () => deleteMember(),
                    child: Text('Hapus Data'))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
