import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'package:get/get.dart';

import '../controllers/create_member_controller.dart';

class CreateMemberView extends GetView<CreateMemberController> {
  final inputSpace = 7.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Baru'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultMargin * 2,
              vertical: kDefaultMargin * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Daftarkan Member Baru',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                // Field: Nama Pelanggan
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Member",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: inputSpace),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Masukkan Nama Member',
                        ),
                        onChanged: (value) => controller.nama.value = value,
                        validator: Validators.compose([
                          Validators.required("Nama Member tidak boleh kosong"),
                          Validators.maxLength(
                              30, "Nama Member maksimal 30 karakter"),
                        ]),
                      ),
                    ],
                  ),
                ),
                // Field: NIM Pengguna
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NIM Pengguna",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: inputSpace),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Masukkan NIM Pengguna',
                        ),
                        onChanged: (value) => controller.nim.value = value,
                        validator: Validators.compose([
                          Validators.required(
                              "NIM Pengguna tidak boleh kosong"),
                          Validators.maxLength(
                              60, "NIM Pengguna maksimal 60 karakter"),
                        ]),
                      ),
                    ],
                  ),
                ),
                // Field: Bidang Pengguna
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bidang Pengguna",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: inputSpace),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Masukkan Bidang Pengguna',
                        ),
                        onChanged: (value) => controller.bidang.value = value,
                      ),
                    ],
                  ),
                ),
                // Field: Role Pengguna
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Role Pengguna",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: inputSpace),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Masukkan Role Pengguna',
                        ),
                        onChanged: (value) => controller.role.value = value,
                      ),
                    ],
                  ),
                ),

                // Submit Button
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
                      child: Text('Simpan Member'),
                      onPressed: controller.isSubmit.isFalse
                          ? controller.onSubmit
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
