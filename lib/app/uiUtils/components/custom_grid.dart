import 'package:flutter/material.dart';

class CustomNormalGridView extends StatelessWidget {
  final List<String> mediaFiles;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final Function(int) onRemove;
  final ScrollController? scrollController;
  final Function(String) onFavorite; 
  final bool Function(String) isFavorite; 

  const CustomNormalGridView({
    super.key,
    required this.mediaFiles,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.childAspectRatio,
    required this.onRemove,
    required this.onFavorite,
    required this.isFavorite,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: mediaFiles.length,
      itemBuilder: (context, index) {
        final gifUrl = mediaFiles[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  gifUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => onFavorite(gifUrl), 
                  child: Icon(
                    isFavorite(gifUrl) ? Icons.favorite : Icons.favorite_border, 
                    color: isFavorite(gifUrl) ? Colors.red : Colors.green,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
