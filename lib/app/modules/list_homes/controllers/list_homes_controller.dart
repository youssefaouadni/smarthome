import 'dart:convert';

import 'package:get/get.dart';

import '../../../../utils/config.dart';
import '../../../data/models/home_model.dart';
import 'package:http/http.dart' as http;

class ListHomesController extends GetxController {
  RxList<Homes> homes = <Homes>[].obs;
  RxBool loading = false.obs;
  @override
  void onInit()async {
    super.onInit();
    await getHomes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getHomes() async {
    loading.value=true;
    String url = "${Environement.URL}/api/v1/homes";//link postman
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));//exucuter requet http send in postman
      homes.value = (jsonDecode(response.body) as List)
          .map((e) => Homes.fromJson(e))
          .toList();
      print(homes[0].dateOeuvre);
    } catch (e) {
      print(e);
    }
    loading.value=false;
  }
}
