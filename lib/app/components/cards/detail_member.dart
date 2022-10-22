import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import 'package:get/get.dart';

class DetailMemberView extends StatelessWidget {
  const DetailMemberView({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Data member;

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
        Center(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 75,
                  height: 75,
                  child: CircleAvatar(
                      radius: 85,
                      backgroundColor: backgroundFoto,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
              ),
              Text(
                member.nama.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                member.nim.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                member.bidang.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                member.role.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Divider(),
              ElevatedButton(
                  onPressed: () =>
                      Get.toNamed(Routes.EDIT_MEMBER, arguments: member),
                  child: Text('Edit Data'))
            ],
          ),
        ),
      ],
    );
  }
}
