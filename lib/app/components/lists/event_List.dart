import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/components/cards/event_card.dart';
import 'package:flutter_gdscmaliki/app/data/models/event_model.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

class EventList extends StatelessWidget {
  const EventList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<EventData> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: kDefaultMargin),
      itemCount: data.length,
      reverse: true,
      itemBuilder: (context, index) => EventCard(data: data[index]),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
