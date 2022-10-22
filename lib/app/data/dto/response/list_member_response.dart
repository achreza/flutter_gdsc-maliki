import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';

class ListMemberResponse {
  final bool success;
  final String message;
  final List<Data> data;

  ListMemberResponse(
      {required this.success, required this.message, required this.data});

  factory ListMemberResponse.fromJson(Map<String, dynamic> json) {
    return ListMemberResponse(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((e) => Data.fromJson(e))
            .toList());
  }
}
