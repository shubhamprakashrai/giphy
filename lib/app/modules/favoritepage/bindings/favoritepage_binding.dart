import 'package:get/get.dart';

import '../controllers/favoritepage_controller.dart';

class FavoritepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritePageController>(
      () => FavoritePageController(),
    );
  }
}
