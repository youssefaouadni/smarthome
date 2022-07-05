import 'package:get/get.dart';

import '../controllers/add_pairings_controller.dart';

class AddPairingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPairingsController>(
      () => AddPairingsController(),
    );
  }
}
