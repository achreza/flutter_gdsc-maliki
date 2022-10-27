import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/components/drawers/main_drawer.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeNavView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(controller.userProfile),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/gdsc_white.png', scale: 15),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () async {
                controller.showAlertDialog(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: TabBarView(
        controller: controller.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTab,
          backgroundColor: Colors.grey.shade100,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
