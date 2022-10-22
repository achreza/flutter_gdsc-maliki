import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/components/cards/member_card.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

class MemberList extends StatelessWidget {
  const MemberList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: kDefaultMargin * 2),
      itemCount: data.length,
      reverse: true,
      itemBuilder: (context, index) => MemberCard(data: data[index]),
      separatorBuilder: (context, index) => SizedBox(height: kDefaultMargin),
    );
  }
}
