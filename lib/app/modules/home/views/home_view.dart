import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/components/lists/member_list.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchAllMembers();
    return Scaffold(
      body: Obx(
        () => controller.isFetchingMember.isTrue
            ? _LoadingState()
            : controller.members.isEmpty
                ? _EmptyState()
                : _NotEmptyState(),
      ),
      floatingActionButton: Obx(
        () => controller.members.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              )
            : Container(),
      ),
    );
  }
}

class _NotEmptyState extends StatelessWidget {
  _NotEmptyState({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => controller.fetchAllMembers(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PageTitle(),
            Container(
              child: Text(
                'Member Aktif',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              margin: EdgeInsets.only(
                left: 3,
                top: 2,
                bottom: 1,
              ),
            ),
            MemberList(data: controller.members),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  _EmptyState({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PageTitle(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Belum Ada Member',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: 2),
                // AddOrderButton(onTap: controller.navigateToCreateOrder),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingState extends StatelessWidget {
  _LoadingState({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PageTitle(),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 3,
        right: 3,
        top: 2,
      ),
      child: Text(
        'List Member',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
