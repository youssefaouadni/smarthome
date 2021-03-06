import 'dart:convert';

import 'package:get/get.dart';

import '../../../../utils/config.dart';
import '../../../data/models/users_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<Users> users = <Users>[].obs;
  RxBool loading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await getUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUsers() async {
    loading.value=true;
    String url = "${Environement.URL}/api/v1/users";//link postman
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));//exucuter requet http send in postman
      users.value = (jsonDecode(response.body) as List)
          .map((e) => Users.fromJson(e))
          .toList();
      print(users[0].email);
    } catch (e) {
      print(e);
    }
    loading.value=false;
  }
}
