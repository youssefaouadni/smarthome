import 'package:get/get.dart';

import '../controllers/list_pairings_controller.dart';

class ListPairingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPairingsController>(
      () => ListPairingsController(),
    );
  }
}
