import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/config.dart';
import '../../../data/models/pairing.dart';

class ListPairingsController extends GetxController {
  RxBool loading = false.obs;
  RxList<Pairings> pairings= <Pairings>[].obs;
  @override
  void onInit() async {
    super.onInit();
    await getPairings();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPairings() async {
    loading.value=true;
    String url = "${Environement.URL}/api/v1/pairings";//link postman
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));//exucuter requet http send in postman
      pairings.value = (jsonDecode(response.body) as List)
          .map((e) => Pairings.fromJson(e))
          .toList();
      print(pairings[0].owner.toString());
    } catch (e) {
      print(e);
    }
    loading.value=false;
  }
}
