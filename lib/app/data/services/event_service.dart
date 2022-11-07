import 'dart:developer';
import 'dart:io';

import 'package:dio/src/response.dart' as RS;
import 'package:flutter_gdscmaliki/app/data/dto/request/create_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/update_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/dto/response/list_member_response.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/app/data/providers/member_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../dto/response/response.dart';
import '../providers/event_provider.dart';

class EventService {
  final EventProvider eventProvider = Get.find<EventProvider>();

  Future<EventService> init() async => this;

  onInit() {
    print('Service Init');
    Future<EventService> init() async => this;
  }

  Future<ListMemberResponse> getAllEvents() async {
    final response = await eventProvider.getAllEvents();
    final ListMemberResponse memberResponse =
        ListMemberResponse.fromJson(response!.data);

    return memberResponse;
  }

  Future<void> getDetailEvent(int id) async {
    final response = await eventProvider.getEvent(id);
    final MemberResponse memberResponse =
        MemberResponse.fromJson(response!.data);
    // return memberResponse.data;
  }

  Future<void> deleteEvent(int id) async {
    final response = await eventProvider.delete(id);
    if (response.statusCode == HttpStatus.ok) {
      log('Delete Success');
    } else {
      log('Delete Failed');
    }
  }

  Future<void> createEvent(CreateMemberRequest requestData) async {
    final response = await eventProvider.postEvent(requestData);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Gagal membuat member');
      case HttpStatus.unprocessableEntity:
        throw Exception('Gagal membuat member');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }
  }

  Future<void> updateMember(int id, updateMemberRequest requestData) async {
    final response = await eventProvider.update(id, requestData);

    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw Exception('Gagal mengubah Member');
      case HttpStatus.unprocessableEntity:
        throw Exception('Gagal mengubah Member');
      case null:
        throw Exception('Gagal menghubungkan ke server');
      default:
    }
  }
}
