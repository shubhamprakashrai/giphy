import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/utils/app_constant/app_extension.dart';
import 'package:giphyapp/app/uiUtils/components/custom_logout.dart';
import 'package:giphyapp/app/uiUtils/components/custom_search.dart';
import 'package:giphyapp/app/uiUtils/components/gif_detailed.dart';
import 'package:giphyapp/app/uiUtils/components/shimmer_effect.dart';
import 'package:giphyapp/app/modules/home/controllers/home_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.L.trendingGifsTitle),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () async {
              bool shouldLogout = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return CustomLogoutDialog(
                    onLogout: () async {
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      Get.offNamed("/login");
                    },
                  );
                },
              );
              if (shouldLogout == true) {
                await FirebaseAuth.instance.signOut();
                Get.offNamed("/login");
              }
            },
            child: const Icon(Icons.logout_outlined),
          ).paddingOnly(right: 15)
        ],

      ),
      body: Column(
        children: [
          SearchPage(
            onSearch: (String? query) {
              if(query?.isEmpty ?? true){
                controller.fetchTrendingGifs();
              }
              controller.searchGifs(query ?? ""); // Trigger search
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
                    GifGridDetailed(
                      gifDataList: controller.gifData,
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
      )
          .paddingSymmetric(horizontal: 10),
    );
  }
}
