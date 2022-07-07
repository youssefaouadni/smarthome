import 'package:get/get.dart';

import '../controllers/add_devices_controller.dart';

class AddDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDevicesController>(
      () => AddDevicesController(),
    );
  }
}
