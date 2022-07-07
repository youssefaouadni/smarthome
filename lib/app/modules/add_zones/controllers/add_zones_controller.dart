import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../components/alert_component.dart';
import '../../../../utils/config.dart';
import '../../../data/models/device_model.dart';

class AddZonesController extends GetxController {
  RxList<String> role = ["Installer", "Owner"].obs;
  RxString dropDownValue = "Installer".obs;
  TextEditingController labelController = TextEditingController();
  RxList<String> devices = <String>[].obs;
  RxString device = "00584795".obs;
  RxList<Devices> devicesList = <Devices>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getDevices();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDevices() async {
    String url = "${Environement.URL}/api/v1/devices"; //link postman
    print(url);
    try {
      http.Response response =
          await http.get(Uri.parse(url)); //exucuter requet http send in postman
      devicesList.value = (jsonDecode(response.body) as List)
          .map((e) => Devices.fromJson(e))
          .toList();
      print(devicesList[0].ref);
      for (var device in devicesList) {
        devices.add(device.ref!);
        print(devices.length);
      }
    } catch (e) {
      print(e);
    }
  }

  addZone() async {
    String url = "${Environement.URL}/api/v1/users";
    Map data = {
      "label": labelController.text,
      "devices": device.value,
      "pairings": dropDownValue.value
    };
    print(data);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(data)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      AlertComponent alertComponent = AlertComponent(
          errorMessage: "Zone Added successfully", title: 'Add zone');
      alertComponent.showMyDialog();
    } else {
      AlertComponent alertComponent = AlertComponent(
          errorMessage: "Problem occurred while adding zone",
          title: "Add zone");
      alertComponent.showMyDialog();
    }

    httpClient.close();
    labelController.clear();

    return reply;
  }
}
