import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../../../../components/alert_component.dart';
import '../../../../utils/config.dart';

class AddPairingsController extends GetxController {
  RxList<String> role = ["Installer", "Owner"].obs;
  RxString dropDownValue = "Installer".obs;
  bool installer=true;
  bool owner=false;
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

  addPairing() async {
    String url = "${Environement.URL}/api/v1/pairings";
    Map data = {
      "installer": installer,
      "owner": owner,
    };

    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(data)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      AlertComponent alertComponent =
          AlertComponent(errorMessage: "Pairing Added successfully",title: "Add pairing");
      alertComponent.showMyDialog();
    } else {
      AlertComponent alertComponent =
          AlertComponent(errorMessage: "Problem occurred while adding pairing",title: "Add pairing");
      alertComponent.showMyDialog();
    }

    httpClient.close();

    return reply;
  }
}
