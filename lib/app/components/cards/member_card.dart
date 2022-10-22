import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';
import 'package:get/get.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Data? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultMargin * 3),
      child: InkWell(
        onTap: () {
          // Get.toNamed(Routes.DETAIL_MEMBER, arguments: data.id);
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
            child: Column(
              children: [
                Text(data!.nama.toString()),
              ],
            )),
      ),
    );
  }
}
