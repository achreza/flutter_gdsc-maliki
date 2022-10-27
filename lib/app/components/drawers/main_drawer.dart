import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/profile.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends GetView<HomeController> {
  const MainDrawer(this.user);

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.username,
                  style:
                      GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              controller.changeTab(0);
            },
          ),
          ListTile(
            title: Text('Reels'),
            onTap: () {
              controller.changeTab(2);
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              controller.changeTab(3);
            },
          ),
        ],
      ),
    );
  }
}
