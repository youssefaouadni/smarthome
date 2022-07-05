import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home/utils/config.dart';

import '../../../../components/alert_component.dart';

class AddUserController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  RxBool loading = false.obs;
  RxList<String> role=["Installer","Owner"].obs;
  RxString dropDownValue="Installer".obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addUser() async {
    String url = "${Environement.URL}/api/v1/users";
    Map data = {
      "name": firstNameController.text,
      "lastname": lastNameController.text,
      "email": emailNameController.text,
      "address": emailNameController.text,
      "role": dropDownValue.value
    };

    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(data)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      AlertComponent alertComponent =
          AlertComponent(errorMessage: "User Added successfully",title: 'Add user');
      alertComponent.showMyDialog();
    } else {
      AlertComponent alertComponent =
          AlertComponent(errorMessage: "Problem occurred while adding user",title: "Add user");
      alertComponent.showMyDialog();
    }

    httpClient.close();
    firstNameController.clear();
    lastNameController.clear();
    emailNameController.clear();
    emailNameController.clear();
    roleController.clear();
    return reply;
  }
}
