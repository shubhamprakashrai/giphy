import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/controllers/home_controller.dart';

class FavoritepageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>(); // Use Get.find() instead of Get.put()

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.favoriteGifUrls.isEmpty) {
          return const Center(child: Text('No favorite GIFs'));
        }

        return GridView.builder(
          itemCount: controller.favoriteGifUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final gifUrl = controller.favoriteGifUrls.toList()[index]; // Convert to List for indexed access
            return Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: gifUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  matchTextDirection: true,
                  progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
                ),
                // Image.network(
                //   gifUrl,
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                //   height: double.infinity,
                // ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      controller.toggleFavoriteGif(gifUrl); // Toggle favorite on tap
                    },
                    child: Obx(() => Icon(
                      controller.isFavorite(gifUrl) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    )),
                  ),
                ),
              ],
            );
          },
        ).paddingSymmetric(horizontal: 10);
      }),
    );
  }
}
