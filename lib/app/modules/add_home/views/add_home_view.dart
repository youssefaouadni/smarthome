import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../utils/SHComman.dart';
import '../../app_drawer/views/app_drawer_view.dart';
import '../controllers/add_home_controller.dart';

class AddHomeView extends GetView<AddHomeController> {
  const AddHomeView({Key? key}) : super(key: key);
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
                          controller: controller.versionHard,
                          cursorColor: white,
                          textFieldType: TextFieldType.USERNAME,
                          decoration: buildSHInputDecoration('Version Hard',
                              textColor: Colors.black),
                        ),
                        16.height,
                        AppTextField(
                          controller: controller.versionSoft,
                          textStyle: primaryTextStyle(color: Colors.black),
                          cursorColor: white,
                          textFieldType: TextFieldType.USERNAME,
                          decoration: buildSHInputDecoration('Version Soft',
                              textColor: Colors.black),
                        ),
                        16.height,
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: FractionalOffset.centerLeft,
                            child: Text("Date fabrication",
                              style: TextStyle(

                              ),),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: SfDateRangePicker(
                            onSelectionChanged: controller.onSelectionChangedDateFab,
                            selectionMode: DateRangePickerSelectionMode.single,
                          ),
                        ),
                        const SizedBox(height: 20,),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: FractionalOffset.centerLeft,
                            child: Text("Date Ouevre",
                              style: TextStyle(

                              ),),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: SfDateRangePicker(
                            onSelectionChanged: controller.onSelectionChangedDateOeuvre,
                            selectionMode: DateRangePickerSelectionMode.single,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        AppTextField(
                          controller: controller.zone,
                          textStyle: primaryTextStyle(color: Colors.black),
                          cursorColor: white,
                          textFieldType: TextFieldType.EMAIL,
                          decoration: buildSHInputDecoration('Zones',
                              textColor: Colors.black),
                        ),
                        16.height,
                        AppTextField(
                          controller: controller.label,
                          textStyle: primaryTextStyle(color: Colors.black),
                          cursorColor: white,
                          textFieldType: TextFieldType.ADDRESS,
                          decoration: buildSHInputDecoration('Label',
                              textColor: Colors.black),
                        ),
                        16.height,
                        AppTextField(
                          controller: controller.location,
                          textStyle: primaryTextStyle(color: Colors.black),
                          cursorColor: white,
                          textFieldType: TextFieldType.ADDRESS,
                          decoration: buildSHInputDecoration('Location',
                              textColor: Colors.black),
                        ),
                        16.height,

                        const SizedBox(height: 20,),
                        button(
                          context: context,
                          textColor: white,
                          width: Get.width,
                          text: 'Add Home',
                          onTap: () async {
                                controller.addHome();
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
