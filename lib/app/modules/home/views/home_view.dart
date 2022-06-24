import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smart_home/app/modules/app_drawer/views/app_drawer_view.dart';
import 'package:smart_home/components/users_cart.dart';
import '../../../../utils/SHColors.dart';
import '../../../../utils/SHComman.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
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
                    ? Container(
                        height: 600.h * controller.users.length,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.users.length,
                          itemBuilder: (BuildContext context, int index) {
                            return UsersCart(
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
