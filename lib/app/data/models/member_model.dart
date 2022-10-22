class Member {
  String? message;
  List<Data>? data;

  Member({this.message, this.data});

  Member.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['message'] = message;
  //   if (data != null) {
  //     data['data'] = data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }

}

class Data {
  int? id;
  String? nama;
  String? nim;
  String? role;
  String? bidang;

  Data(
      {required this.id,
      required this.nama,
      required this.nim,
      required this.role,
      required this.bidang});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nim = json['nim'];
    role = json['role'];
    bidang = json['bidang'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['nim'] = nim;
    data['role'] = role;
    data['bidang'] = bidang;
    return data;
  }
}
