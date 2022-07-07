import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home/app/data/models/zones_model.dart';

import '../../../../utils/config.dart';

class ListZonesController extends GetxController {
  RxList<Zone> zones = <Zone>[].obs;
  RxBool loading = false.obs;
  @override
  void onInit() async{
    super.onInit();
    await getZones();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getZones() async {
    loading.value=true;
    String url = "${Environement.URL}/api/v1/zones";//link postman
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));//exucuter requet http send in postman
      zones.value = (jsonDecode(response.body) as List)
          .map((e) => Zone.fromJson(e))
          .toList();
      print(zones[0].label);
    } catch (e) {
      print(e);
    }
    loading.value=false;
  }
}
