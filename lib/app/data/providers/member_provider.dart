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
    return response;
  }

  Future<Response> postMember(CreateMemberRequest data) async =>
      await dio!.post('/member', data: data.toJson());

  Future<Response> deleteMember(int id) async =>
      await dio!.delete('/member/$id');

  Future<Response> update(int id, updateMemberRequest data) =>
      dio!.patch('/member/$id',
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          }),
          data: data.toJson());

  Future<Response> detail(int id) => dio!.get('/member/$id');

  Future<Response> delete(int id) => dio!.delete('/member/$id');
}
