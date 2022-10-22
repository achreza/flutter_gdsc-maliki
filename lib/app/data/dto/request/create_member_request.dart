// ignore_for_file: non_constant_identifier_names

class CreateMemberRequest {
  final String nama;
  final int nim;
  final String role;
  final String bidang;

  CreateMemberRequest({
    required this.nama,
    required this.nim,
    required this.role,
    required this.bidang,
  });

  Map<dynamic, dynamic> toJson() => {
        'nama': nama,
        'nim': nim,
        'role': role,
        'bidang': bidang,
      };
}
