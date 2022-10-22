import 'package:dio/dio.dart';
import 'package:flutter_gdscmaliki/app/data/dto/response/list_member_response.dart';
import 'package:flutter_gdscmaliki/app/data/providers/member_provider.dart';
import 'package:flutter_gdscmaliki/app/data/services/member_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';

void main() async {
  // Dio dio = Dio();
  // final response = await dio!.get('http://localhost:3000/member',
  //     options: Options(headers: {
  //       'Content-Type': 'application/json',
  //     }));

  // print(response.data);

  // MemberProvider mv = MemberProvider();
  // mv.getAllMember();

  // final MemberProvider memberProvider = Get.find<MemberProvider>();
  Get.put(MemberProvider());
  MemberService mv2 = Get.put(MemberService());

  await mv2.getDetailMember(1);
}
