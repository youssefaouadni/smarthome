import 'package:get/get.dart';

import '../controllers/list_zones_controller.dart';

class ListZonesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListZonesController>(
      () => ListZonesController(),
    );
  }
}
