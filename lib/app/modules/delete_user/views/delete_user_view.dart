import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smart_home/components/delete_user_cart.dart';

import '../../app_drawer/views/app_drawer_view.dart';
import '../controllers/delete_user_controller.dart';

class DeleteUserView extends GetView<DeleteUserController> {
  const DeleteUserView({Key? key}) : super(key: key);
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
                  'Delete User',
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
                child: Obx(() => (!controller.loading.value)
                    ? Container(
                  height: 600.h * controller.users.length,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DeleteUsersCart(
                          name: controller.users[2].name! +
                              controller.users[2].lastname!,
                          address: controller.users[2].address!,
                          mail: controller.users[2].email!,
                          role: controller.users[2].role!);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  ),
                )
                    : const SpinKitPulse(
                  color: Colors.deepOrange,
                  size: 100.0,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
