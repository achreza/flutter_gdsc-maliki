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

class MemberService {
  final MemberProvider memberProvider = Get.find<MemberProvider>();

  Future<MemberService> init() async => this;

  onInit() {
    print('Service Init');
    Future<MemberService> init() async => this;
  }

  Future<ListMemberResponse> getAllMembers() async {
    final response = await memberProvider.getAllMember();
    final ListMemberResponse memberResponse =
        ListMemberResponse.fromJson(response!.data);

    return memberResponse;
  }

  Future<void> getDetailMember(int id) async {
    final response = await memberProvider.getMember(id);
    final MemberResponse memberResponse =
        MemberResponse.fromJson(response!.data);
    // return memberResponse.data;
  }

  Future<void> deleteMember(int id) async {
    final response = await memberProvider.delete(id);
    if (response.statusCode == HttpStatus.ok) {
      log('Delete Success');
    } else {
      log('Delete Failed');
    }
  }

  Future<void> createOrder(CreateMemberRequest requestData) async {
    final response = await memberProvider.postMember(requestData);

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
    final response = await memberProvider.update(id, requestData);

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

  // Future<void> cancelOrder(int id) async {
  //   final response = await memberProvider.cancel(id);

  //   switch (response.statusCode) {
  //     case HttpStatus.badRequest:
  //       throw Exception('Gagal membatalkan order');
  //     case HttpStatus.unprocessableEntity:
  //       throw Exception('Gagal membatalkan order');
  //     case null:
  //       throw Exception('Gagal menghubungkan ke server');
  //     default:
  //   }
  // }

  // Future<void> completeOrder(int id) async {
  //   final response = await memberProvider.complete(id);

  //   switch (response.statusCode) {
  //     case HttpStatus.badRequest:
  //       throw Exception('Gagal menyelesaikan order');
  //     case HttpStatus.unprocessableEntity:
  //       throw Exception('Gagal menyelesaikan order');
  //     case null:
  //       throw Exception('Gagal menghubungkan ke server');
  //     default:
  //   }
  // }

  // Future<List<Order>> getOngoingOrders() async {
  //   final response = await memberProvider.getOngoingOrders();
  //   final ListOrderResponse orderResponse =
  //       ListOrderResponse.fromJson(response.body);
  //   return orderResponse.data;
  // }

  // Future<Order> getDetailOrder(int id) async {
  //   final response = await memberProvider.detail(id);
  //   final OrderResponse orderResponse = OrderResponse.fromJson(response.body);
  //   return orderResponse.data;
  // }

  // Future<List<Order>> getHistoryOrders() async {
  //   final response = await memberProvider.getHistoryOrders();
  //   final ListOrderResponse orderResponse =
  //       ListOrderResponse.fromJson(response.body);
  //   return orderResponse.data;
  // }
}
