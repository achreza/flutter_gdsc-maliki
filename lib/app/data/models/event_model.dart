class Event {
  String? message;
  List<EventData>? data;

  Event({this.message, this.data});

  Event.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <EventData>[];
      json['data'].forEach((v) {
        data!.add(new EventData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventData {
  int? id;
  String? nama;
  String? tipe;
  String? durasi;
  String? bidang;

  EventData({this.id, this.nama, this.tipe, this.durasi, this.bidang});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    tipe = json['tipe'];
    durasi = json['durasi'];
    bidang = json['bidang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['tipe'] = this.tipe;
    data['durasi'] = this.durasi;
    data['bidang'] = this.bidang;
    return data;
  }
}
