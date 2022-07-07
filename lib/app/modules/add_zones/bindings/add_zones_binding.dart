import 'package:get/get.dart';

import '../controllers/add_zones_controller.dart';

class AddZonesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddZonesController>(
      () => AddZonesController(),
    );
  }
}
