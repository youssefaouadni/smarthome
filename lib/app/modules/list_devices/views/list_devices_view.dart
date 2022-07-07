import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/SHComman.dart';
import '../../app_drawer/views/app_drawer_view.dart';
import '../controllers/list_devices_controller.dart';

class ListDevicesView extends GetView<ListDevicesController> {
  const ListDevicesView({Key? key}) : super(key: key);
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
              Text(
                'Hi Admin!',
                style: boldTextStyle(color: white, size: 16),
              ).paddingOnly(left: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: commonSHCachedNetworkImage(
                    'https://cdn.pixabay.com/photo/2019/02/06/14/42/android-3979307_960_720.jpg',
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ).cornerRadiusWithClipRRect(20).onTap(
                        () {},
                      ),
                ),
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
                    ? SizedBox(
                        height: 50.h * controller.devices.length,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.devices.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(

                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Text(
                                   "Ref: ${controller.devices[index].ref}"),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
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
