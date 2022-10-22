import 'package:dio/dio.dart' as diop;
import 'package:dio/dio.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/create_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/update_member_request.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import '../models/member_model.dart';

class MemberProvider {
  Dio dio = Dio(BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  Future<Response?> getMember(int id) async {
    final response = await dio!.get('/member$id');
    return response;
  }

  Future<Response?> getAllMember() async {
    final response = await dio!.get('/member');
    print('Response : ${response}');
    return response;
  }

  Future<Response<Member>> postMember(Member member) async => await dio!.get(
        '/member',
      );
  Future<Response> deleteMember(int id) async =>
      await dio!.delete('/member/$id');

  Future<Response> create(CreateMemberRequest data) => dio!.post('/member');

  Future<Response> update(int id, updateMemberRequest data) =>
      dio!.put('/member/$id');

  Future<Response> detail(int id) => dio!.get('member/$id');
}
