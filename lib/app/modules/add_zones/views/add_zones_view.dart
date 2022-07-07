import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/SHComman.dart';
import '../../app_drawer/views/app_drawer_view.dart';
import '../controllers/add_zones_controller.dart';

class AddZonesView extends GetView<AddZonesController> {
  const AddZonesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Smart Home"),
      ),
      drawer: AppDrawerView(),
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
                          controller: controller.labelController,
                          cursorColor: white,
                          textFieldType: TextFieldType.USERNAME,
                          decoration: buildSHInputDecoration('label',
                              textColor: Colors.black),
                        ),
                        16.height,

                        Obx(()=>Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width,
                            child: DropdownButton<String>(
                              value: controller.dropDownValue.value,
                              icon:  Padding(
                                padding: EdgeInsets.only(left: 280.0.w),
                                child: Icon(Icons.arrow_downward),
                              ),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black45),
                              underline: Container(
                                height: 2,
                                color: Colors.deepOrangeAccent,
                              ),
                              onChanged: (String? newValue) {
                                controller.dropDownValue.value = newValue!;
                                print(controller.dropDownValue);
                              },
                              items: controller.role
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),

                        const SizedBox(height: 20,),
                        Obx(()=>(controller.devices.isNotEmpty)?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width,
                            child: DropdownButton<String>(
                              value: controller.device.value,
                              icon:  Padding(
                                padding: EdgeInsets.only(left: 265.0.w),
                                child: Icon(Icons.arrow_downward),
                              ),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black45),
                              underline: Container(
                                height: 2,
                                color: Colors.deepOrangeAccent,
                              ),
                              onChanged: (String? newValue) {
                                controller.device.value = newValue!;
                                print(controller.device);
                              },
                              items: controller.devices
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ):CircularProgressIndicator()),
                        button(
                          context: context,
                          textColor: white,
                          width: Get.width,
                          text: 'Add user',
                          onTap: () async {
                             controller.addZone();
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
