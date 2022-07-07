import 'package:get/get.dart';

import '../controllers/list_homes_controller.dart';

class ListHomesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListHomesController>(
      () => ListHomesController(),
    );
  }
}
