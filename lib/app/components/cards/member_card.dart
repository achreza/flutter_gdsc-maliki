import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';
import 'package:get/get.dart';

class MemberCard extends GetView<HomeController> {
  const MemberCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Data? data;

  @override
  Widget build(BuildContext context) {
    Color backgroundFoto = data!.role == 'Lead'
        ? Colors.blue
        : data!.role == 'Core Team'
            ? Colors.red
            : data!.role == 'Association Core'
                ? Colors.green
                : Colors.grey;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultMargin * 3),
      child: InkWell(
        onTap: () {
          controller.bottomDetail(data!);
        },
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultMargin * 2,
              vertical: kDefaultMargin * 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: kDefaultMargin * 2),
                  child: CircleAvatar(
                      radius: 24,
                      backgroundColor: backgroundFoto,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      )),
                ),
                Text(data!.nama.toString()),
              ],
            )),
      ),
    );
  }
}
