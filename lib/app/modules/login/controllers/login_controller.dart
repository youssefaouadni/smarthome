import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home/utils/config.dart';

import '../../home/bindings/home_binding.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
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

  void increment() => count.value++;


  Future login(String username, String password) async {
    String url = Environement.SSO_URL + Environement.GET_TOKEN_URL;
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    Map<String, String> data = {
      'client_id': Environement.CLIEN_ID,
      'grant_type': Environement.PASSWORD,
      'username': username,
      'password': password,
      'client_secret': Environement.clientSecret,
      'refresh_token': Environement.REFRESH_TOKEN
    };
    try {
      http.Response response =
      await http.post(Uri.parse(url), headers: headers, body: data);
      if (response.statusCode == 200) {

        Get.off(HomeView(), binding: HomeBinding());
      } else {

      }
    } catch (e) {
      print(e);
    }
  }
}
