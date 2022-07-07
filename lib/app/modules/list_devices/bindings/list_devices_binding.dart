import 'package:get/get.dart';

import '../controllers/list_devices_controller.dart';

class ListDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDevicesController>(
      () => ListDevicesController(),
    );
  }
}
