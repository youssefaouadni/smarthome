import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertComponent {

  String errorMessage;
  String title;
  AlertComponent({required this.errorMessage,required this.title});

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(title),//title
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(errorMessage),//text inside dialog

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();//close
              },
            ),
          ],
        );
      },
    );
  }
}
