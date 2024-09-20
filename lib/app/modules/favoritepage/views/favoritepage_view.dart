import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/controllers/home_controller.dart';


import '../../../uiUtils/components/gifGrid.dart';

class FavoritepageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.favoriteGifUrls.isEmpty) {
          return const Center(child: Text('No favorite GIFs'));
        }

        return GifGrid(
          gifUrls: controller.favoriteGifUrls.toList(),
          onFavoriteToggle: (gifUrl) => controller.toggleFavoriteGif(gifUrl),
          isFavorite: (gifUrl) => controller.isFavorite(gifUrl),
        );
      }),
    );
  }
}
