import 'package:flutter_gdscmaliki/app/data/models/event_model.dart';

class ListEventResponse {
  final String message;
  final List<EventData> data;

  ListEventResponse({required this.message, required this.data});

  factory ListEventResponse.fromJson(Map<String, dynamic> json) {
    return ListEventResponse(
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((e) => EventData.fromJson(e))
            .toList());
  }
}
