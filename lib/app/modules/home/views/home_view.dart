import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/app_extension.dart';
import 'package:giphyapp/app/uiUtils/components/custom_search.dart';
import 'package:giphyapp/app/uiUtils/components/shimmer_effect.dart';
import 'package:giphyapp/app/modules/home/controllers/home_controller.dart';

import '../../../uiUtils/components/gifGrid.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
              if (controller.isLoading.value && controller.gifUrls.isEmpty) {
                return const ShimmerEffect();
              } else {
                return Stack(
                  children: [
                    if (controller.gifUrls.isEmpty && !controller.isLoading.value)
                      Center(child: Text(context.L.noGifsMessage)),
                    GifGrid(
                      gifUrls: controller.gifUrls,
                      scrollController: controller.scrollController,
                      onFavoriteToggle: (gifUrl) => controller.toggleFavoriteGif(gifUrl),
                      isFavorite: (gifUrl) => controller.isFavorite(gifUrl),
                    ),
                    if (controller.isLoading.value && controller.gifUrls.isNotEmpty)
                      const Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Center(child: CircularProgressIndicator()),
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
