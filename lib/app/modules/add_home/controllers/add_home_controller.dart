import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../components/alert_component.dart';
import '../../../../utils/config.dart';

class AddHomeController extends GetxController {
  TextEditingController versionHard = TextEditingController();
  TextEditingController versionSoft = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController label = TextEditingController();
  TextEditingController location = TextEditingController();
  DateTime? dateFab;
  DateTime? dateOeuvre;
  @override
  void onInit() async {
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

  void onSelectionChangedDateFab(DateRangePickerSelectionChangedArgs args) {
    dateFab = args.value;
    if (kDebugMode) {
      print("dateFab${dateFab!.toIso8601String().split('T').first}");
    }
  }

  void onSelectionChangedDateOeuvre(DateRangePickerSelectionChangedArgs args) {
    dateOeuvre = args.value;
    if (kDebugMode) {
      print("dateOeuvre${dateOeuvre!.toIso8601String().split('T').first}");
    }
  }

  addHome() async {
    String url = "${Environement.URL}/api/v1/homes";
    Map data = {
      "verHard": versionHard.text,
      "verSoft": versionSoft.text,
      "dateFab": dateFab!.toIso8601String().split('T').first,
      "dateOeuvre": dateOeuvre!.toIso8601String().split('T').first,
      "zones": null,
      "label": label.text,
      "location": location.text
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
            errorMessage: "Home Added successfully", title: 'Add home');
        alertComponent.showMyDialog();
      } else {
        if (kDebugMode) {
          print(reply);
        }
        AlertComponent alertComponent = AlertComponent(
            errorMessage: "Problem occurred while adding Home",
            title: "Add home");
        alertComponent.showMyDialog();
      }

      httpClient.close();
      versionHard.clear();
      versionSoft.clear();
      zone.clear();
      label.clear();
      location.clear();
      return reply;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
