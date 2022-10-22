import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import 'package:get/get.dart';

import '../controllers/detail_member_controller.dart';

class DetailMemberView extends GetView<DetailMemberController> {
  @override
  Widget build(BuildContext context) {
    Color backgroundFoto = controller.member.role == 'Lead'
        ? Colors.blue
        : controller.member.role == 'Core Team'
            ? Colors.red
            : controller.member.role == 'Association Core'
                ? Colors.green
                : Colors.grey;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Detail Member'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 100,
                height: 100,
                child: CircleAvatar(
                    radius: 100,
                    backgroundColor: backgroundFoto,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    )),
              ),
            ),
            Text(
              controller.member.nama.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              controller.member.nim.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              controller.member.bidang.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              controller.member.role.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => controller.navigateToEditMember(),
        child: Icon(Icons.edit),
      ),
    );
  }
}
