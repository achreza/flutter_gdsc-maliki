import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/event_model.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final EventData? data;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/itincu.png',
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
        footer: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: Center(
              child: Text(
                data!.nama.toString(),
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            )),
      ),
    );
  }
}
