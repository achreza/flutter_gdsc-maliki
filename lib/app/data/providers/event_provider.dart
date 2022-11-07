import 'package:dio/dio.dart' as diop;
import 'package:dio/dio.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/create_member_request.dart';
import 'package:flutter_gdscmaliki/app/data/dto/request/update_member_request.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import '../models/member_model.dart';

class EventProvider {
  Dio dio = Dio(BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  Future<Response?> getEvent(int id) async {
    final response = await dio!.get('/event/$id');
    return response;
  }

  Future<Response?> getAllEvents() async {
    final response = await dio!.get('/event/');
    return response;
  }

  Future<Response> postEvent(CreateMemberRequest data) async =>
      await dio!.post('/event/', data: data.toJson());

  Future<Response> deleteEvent(int id) async => await dio!.delete('/event/$id');

  Future<Response> update(int id, updateMemberRequest data) =>
      dio!.patch('/event/$id',
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          }),
          data: data.toJson());
}
