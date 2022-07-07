import 'package:get/get.dart';

import '../controllers/add_home_controller.dart';

class AddHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddHomeController>(
      () => AddHomeController(),
    );
  }
}
