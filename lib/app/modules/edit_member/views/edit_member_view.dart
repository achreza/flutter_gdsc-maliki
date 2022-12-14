import 'package:flutter/material.dart';
import 'package:flutter_gdscmaliki/app/data/models/member_model.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';

import 'package:get/get.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../controllers/edit_member_controller.dart';

class EditMemberView extends GetView<EditMemberController> {
  final inputSpace = 7.0;

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Lead',
      'label': 'Lead Role',
      'icon': Icon(Icons.star),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'Core Team',
      'label': 'Core Team Role',
      'icon': Icon(Icons.star),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'Association Core',
      'label': 'Association Core Role',
      'icon': Icon(Icons.star),
      'textStyle': TextStyle(color: Colors.green),
    },
    {
      'value': 'Member',
      'label': 'Member Role',
      'icon': Icon(Icons.grade),
      'textStyle': TextStyle(color: Colors.grey),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Member'),
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
                  'Edit Data Member',
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
                        initialValue: controller.nama.value,
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
                        initialValue: controller.nim.value,
                        keyboardType: TextInputType.number,
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
                        initialValue: controller.bidang.value,
                        keyboardType: TextInputType.text,
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
                      SelectFormField(
                        type: SelectFormFieldType.dropdown, // or can be dialog
                        icon: Icon(Icons.star),
                        labelText: 'Role',
                        items: _items,
                        controller: controller.pilihanRole,
                        onChanged: (value) =>
                            controller.pilihanRole!.text = value,
                        onSaved: (value) =>
                            controller.pilihanRole!.text = value!,
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
                      child: Text('Edit Member'),
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
