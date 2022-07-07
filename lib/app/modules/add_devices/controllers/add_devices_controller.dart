import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../components/alert_component.dart';
import '../../../../utils/config.dart';

class AddDevicesController extends GetxController {
  TextEditingController refController = TextEditingController();
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

  addRef() async {
    String url = "${Environement.URL}/api/v1/homes";
    Map data = {
      "ref": refController.text,
    };

    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        AlertComponent alertComponent = AlertComponent(
            errorMessage: "Device Added successfully", title: 'Add device');
        alertComponent.showMyDialog();
      } else {
        if (kDebugMode) {
          print(reply);
        }
        AlertComponent alertComponent = AlertComponent(
            errorMessage: "Problem occurred while adding Device",
            title: "Add device");
        alertComponent.showMyDialog();
      }

      httpClient.close();
      refController.clear();
      return reply;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
