import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/models/search_gifmodels.dart';
import 'package:giphyapp/app/uiUtils/components/animated_text.dart';
import 'package:giphyapp/app/uiUtils/components/image_utils.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';
import 'package:giphyapp/app/utils/app_constant/app_extension.dart';
import 'package:giphyapp/app/utils/app_constant/app_url.dart';
import 'package:url_launcher/url_launcher.dart';

class GifGridDetailed extends StatelessWidget {
  final List<Datum> gifDataList;
  final ScrollController? scrollController;
  final Function(String gifUrl) onFavoriteToggle;
  final Function(String gifUrl) isFavorite;

  const GifGridDetailed({
    super.key,
    required this.gifDataList,
    this.scrollController,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: gifDataList.length,
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final gifData = gifDataList[index];
        final user = gifData.user;
        final username = user?.username;
        final displayName = user?.displayName;
        final avatarUrl = user?.avatarUrl ?? "";
        final instagramUrl = user?.instagramUrl ?? "";
        final resolvedName = (username?.isEmpty ?? true)
            ? displayName?.fCaps ?? ""
            : username!.fCaps;

        if (resolvedName.isEmpty) return const SizedBox.shrink();

        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheet(
                    onClosing: () {},
                    builder: (context) => Container(
                      color: AppColors.purpleColors.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top user info row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        // Avatar
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.white, width: 2),
                                            borderRadius: BorderRadius.circular(1000),
                                          ),
                                          child: ClipOval(
                                            child: ImageUtils.showCachedImage(
                                              url: avatarUrl,
                                              errorWidget: const Icon(Icons.person, color: AppColors.purpleColors),
                                            ),
                                          ),
                                        ),
                                        KSpace.w8,
                                        // Username
                                        Text(
                                          resolvedName,
                                          style: const TextStyle().black.s14.w7.ellipsis,
                                        ),
                                        if (instagramUrl.isNotEmpty) KSpace.w8,
                                        // Instagram link
                                        if (instagramUrl.isNotEmpty)
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.lightBlueAccent, width: 1),
                                              borderRadius: BorderRadius.circular(1000),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                launchUrl(
                                                  Uri.parse(instagramUrl),
                                                  mode: LaunchMode.inAppBrowserView,
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(1000),
                                                child: ImageUtils.showCachedImage(
                                                  url: AppUrl.instagramUrl,
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(user?.description ?? ""),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  // GIF image
                  ImageUtils.showCachedImage(
                    url: gifData.images?.original?.url,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top overlay with avatar and username
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    // Avatar
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.white, width: 2),
                                        borderRadius: BorderRadius.circular(1000),
                                      ),
                                      child: ClipOval(
                                        child: ImageUtils.showCachedImage(
                                          url: avatarUrl,
                                          errorWidget: const Icon(Icons.person, color: AppColors.purpleColors),
                                        ),
                                      ),
                                    ),
                                    KSpace.w8,
                                    // Animated username display
                                    Flexible(
                                      child: AnimatedTextWithPersistence(
                                        displayName: username?.fCaps ?? "",
                                        username: displayName?.fCaps ?? "",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Favorite button
                          GestureDetector(
                            onTap: () => onFavoriteToggle(gifData.images?.original?.url ?? ""),
                            child: Obx(() => Icon(
                                  isFavorite(gifData.images?.original?.url ?? "")
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite(gifData.images?.original?.url ?? "")
                                      ? Colors.red
                                      : Colors.redAccent,
                                  size: 30,
                                )),
                          ),
                        ],
                      ),
                      KSpace.kShrink,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}
