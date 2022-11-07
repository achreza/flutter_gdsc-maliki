import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/profile.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: <Widget>[
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 110,
                          height: 110,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.userProfile.photoURL),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text(
                      controller.userProfile.username,
                      style: GoogleFonts.getFont('Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        'Admin',
                        style: GoogleFonts.getFont('Nunito', fontSize: 14),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  height: 68,
                  width: 335,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Column(
                          children: [
                            Text(
                              controller.members.length.toString(),
                              style: GoogleFonts.getFont('Nunito',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text('Members',
                                style: GoogleFonts.getFont(
                                  'Nunito',
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        child: VerticalDivider(
                          thickness: 2,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Column(
                          children: [
                            Text(
                              controller.events.length.toString(),
                              style: GoogleFonts.getFont('Nunito',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text('Events',
                                style: GoogleFonts.getFont(
                                  'Nunito',
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    width: 335,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.only(left: 20, bottom: 16, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 17,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'My Profile',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 17,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.insights,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Insights',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 17,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.payment,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Payment History',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 17,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Relations',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    width: 335,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.only(left: 20, bottom: 16, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 17,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Settings',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 17,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.help,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Help',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 16,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {
                                controller.showAlertDialog(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    size: 16,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Log Out',
                                    style: GoogleFonts.getFont('Nunito',
                                        fontSize: 14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
