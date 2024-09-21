import 'package:get/get.dart';

import '../controllers/custom_controller.dart';

class CustomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomController>(
      () => CustomController(),
    );
  }
}
