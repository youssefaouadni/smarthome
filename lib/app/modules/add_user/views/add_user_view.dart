import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/SHComman.dart';
import '../../app_drawer/views/app_drawer_view.dart';
import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);
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
                  child: Column(
                    children: [
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black),
                        cursorColor: white,
                        textFieldType: TextFieldType.USERNAME,
                        decoration: buildSHInputDecoration('Name',
                            textColor: Colors.black),
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black),
                        cursorColor: white,
                        textFieldType: TextFieldType.USERNAME,
                        decoration: buildSHInputDecoration('Last Name',
                            textColor: Colors.black),
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black),
                        cursorColor: white,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: buildSHInputDecoration('Email',
                            textColor: Colors.black),
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black),
                        cursorColor: white,
                        textFieldType: TextFieldType.ADDRESS,
                        decoration: buildSHInputDecoration('Address',
                            textColor: Colors.black),
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black),
                        cursorColor: white,
                        textFieldType: TextFieldType.OTHER,
                        decoration: buildSHInputDecoration('Role',
                            textColor: Colors.black),
                      ),
                      16.height,
                      button(
                        context: context,
                        textColor: white,
                        width: Get.width,
                        text: 'Add user',
                        onTap: () {},
                      ),
                      32.height,
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
