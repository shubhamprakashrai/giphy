import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/uiUtils/components/image_utils.dart';

class GifGrid extends StatelessWidget {
  final List<String> gifUrls;
  final ScrollController? scrollController;
  final Function(String gifUrl) onFavoriteToggle;
  final Function(String gifUrl) isFavorite;

  const GifGrid({
    super.key,
    required this.gifUrls,
    this.scrollController,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

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
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                ImageUtils.showCachedImage(
                  url: gifUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
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
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Text("Hello Moto", style: const TextStyle().s14.blue.w7.italic)),
              ],
            ),
          ),
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}
