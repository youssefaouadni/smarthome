import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/SHComman.dart';
import '../../app_drawer/views/app_drawer_view.dart';
import '../controllers/add_devices_controller.dart';

class AddDevicesView extends GetView<AddDevicesController> {
  const AddDevicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Smart Home"),
      ),
      drawer: const AppDrawerView(),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add user',
                  style: boldTextStyle(color: white, size: 16),
                ).paddingOnly(left: 16),
              ),
            ],
          ),
          16.height,
          Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppTextField(
                          textStyle: primaryTextStyle(color: Colors.black),
                          controller: controller.refController,
                          cursorColor: white,
                          textFieldType: TextFieldType.USERNAME,
                          decoration: buildSHInputDecoration('Ref',
                              textColor: Colors.black),
                        ),
                        16.height,
                        const SizedBox(
                          height: 20,
                        ),
                        button(
                          context: context,
                          textColor: white,
                          width: Get.width,
                          text: 'Add Ref',
                          onTap: () async {
                            controller.addRef();
                          },
                        ),
                        32.height,
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
