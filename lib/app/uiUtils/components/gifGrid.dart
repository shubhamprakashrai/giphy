import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class GifGrid extends StatelessWidget {
  final List<String> gifUrls;
  final ScrollController? scrollController;
  final Function(String gifUrl) onFavoriteToggle;
  final Function(String gifUrl) isFavorite;

  const GifGrid({
    Key? key,
    required this.gifUrls,
    this.scrollController,
    required this.onFavoriteToggle,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: gifUrls.length,
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final gifUrl = gifUrls[index];
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
                child: Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => onFavoriteToggle(gifUrl),
                child: Obx(() => Icon(
                  isFavorite(gifUrl) ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite(gifUrl) ? Colors.red : Colors.green,
                  size: 30,
                )),
              ),
            ),
          ],
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}
