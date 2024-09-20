import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/app_extension.dart';
import 'package:giphyapp/app/modules/home/controllers/home_controller.dart';
import 'package:giphyapp/app/uiUtils/components/custom_search.dart';
import 'package:giphyapp/app/uiUtils/components/shimmer_effect.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //  final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.L.trendingGifsTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchPage(
            onSearch: (query) {
              controller.searchGifs(query); // Trigger search
            },
            onClear: () {
              controller.searchGifs(''); // Clear search
            },
          ).paddingSymmetric(horizontal: 8, vertical: 8),
          Expanded(
            child: Obx(() {
              // Observe state changes
              if (controller.isLoading.value && controller.gifUrls.isEmpty) {
                return const ShimmerEffect();
              } else {
                return Stack(
                  children: [
                    if (controller.gifUrls.isEmpty &&
                        !controller.isLoading.value)
                      Center(
                        child: Text(context.L.noGifsMessage),
                      ),
                    GridView.builder(
                      itemCount: controller.gifUrls.length,
                      controller: controller.scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        final gifUrl = controller.gifUrls[index];
                        return Stack(
                          children: [
                            Image.network(
                              gifUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: Obx(() => GestureDetector(
                                  onTap: () =>controller.toggleFavoriteGif(gifUrl), 
                                  child: Icon(
                                   controller.isFavorite(gifUrl) ? Icons.favorite : Icons.favorite_border, 
                                    color:controller.isFavorite(gifUrl) ? Colors.red : Colors.green,
                                    size: 30,
                                  ),
                                ),)
                            ),
                          ],
                        );
                      },
                    ),

                    // CustomNormalGridView(
                    //   key: const PageStorageKey('home_grid'),
                    //   mediaFiles: controller.gifUrls,
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 10.0,
                    //   mainAxisSpacing: 10.0,
                    //   childAspectRatio: 1.0,
                    //   onRemove: (index) {
                    //     controller.removeGif(index);
                    //   },
                    //   onFavorite: (gifUrl) {
                    //     controller.toggleFavoriteGif(gifUrl);
                    //   },
                    //   isFavorite: (gifUrl) => controller.favoriteGifUrls.any((element) => element==gifUrl),
                    //   scrollController: controller.scrollController,
                    // ),
                    if (controller.isLoading.value &&
                        controller.gifUrls.isNotEmpty)
                      const Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Center(
                          child:
                              CircularProgressIndicator(), // Loading indicator
                        ),
                      ),
                  ],
                );
              }
            }),
          ),
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
