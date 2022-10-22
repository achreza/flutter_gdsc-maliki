import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';

class MemberResponse {
  final bool success;
  final String message;
  final Member data;

  MemberResponse(
      {required this.success, required this.message, required this.data});

  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    return MemberResponse(
        success: json['success'],
        message: json['message'],
        data: Member.fromJson(json['data']));
  }
}
