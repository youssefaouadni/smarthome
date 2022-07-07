import 'dart:convert';

import 'package:get/get.dart';
import 'package:smart_home/app/data/models/device_model.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/config.dart';

class ListDevicesController extends GetxController {
  RxList<Devices> devices = <Devices>[].obs;
  RxBool loading = false.obs;
  @override
  void onInit()async {
    super.onInit();
    await getDevices();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getDevices() async {
    loading.value=true;
    String url = "${Environement.URL}/api/v1/devices";//link postman
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));//exucuter requet http send in postman
      devices.value = (jsonDecode(response.body) as List)
          .map((e) => Devices.fromJson(e))
          .toList();
      print(devices[0].ref);
    } catch (e) {
      print(e);
    }
    loading.value=false;
  }
}
