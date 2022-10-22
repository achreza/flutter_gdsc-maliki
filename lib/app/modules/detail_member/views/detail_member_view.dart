import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_member_controller.dart';

class DetailMemberView extends GetView<DetailMemberController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailMemberView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailMemberView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
