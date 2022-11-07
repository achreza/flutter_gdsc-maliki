import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import 'package:get/get.dart';

class EventView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchAllEvents();
    return Scaffold(
      body: Obx(
        () => controller.isFetchingEvent.isTrue
            ? _LoadingState()
            : controller.members.isEmpty
                ? _EmptyState()
                : _NotEmptyState(),
      ),
      floatingActionButton: Obx(
        () => controller.members.isNotEmpty
            ? FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () => controller.navigateToCreateMember(),
                child: Icon(Icons.person_add),
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
              margin: EdgeInsets.only(
                  left: kDefaultMargin * 2, top: kDefaultMargin),
              child: Text(
                'Semua Event',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            // MemberList(data: controller.members),
            Text(controller.events.toString())
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
                  'Belum Ada Event',
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
        left: kDefaultPadding * 2,
        top: kDefaultPadding * 2,
      ),
      child: Text(
        'List Event',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
