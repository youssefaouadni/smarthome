import 'dart:convert';

import 'package:get/get.dart';

import '../../../../utils/config.dart';
import '../../../data/models/users_model.dart';
import 'package:http/http.dart' as http;

class DeleteUserController extends GetxController {
  //TODO: Implement DeleteUserController
  RxList<Users> users = <Users>[].obs;
  RxBool loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() async{
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

  void increment() => count.value++;
  getUsers() async {
    loading.value=true;
    String url = "${Environement.URL}/api/v1/users";
    try {
      http.Response response = await http.get(Uri.parse(url));
      users.value = (jsonDecode(response.body) as List)
          .map((e) => Users.fromJson(e))
          .toList();
      print(users[0].email);
    } catch (e) {
      print(e);
    }
    loading.value=false;
  }

  deleteUser(){
    loading.value=true;
    String url = "http://192.168.1.14:8083/api/v1/users";
    
  }
}
