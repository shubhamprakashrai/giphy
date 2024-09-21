import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/models/search_gifmodels.dart';
import 'package:giphyapp/app/services/language_service.dart';
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
        log.d("Image Data is ${gifDataList[index].url}");
        var gifData = gifDataList[index];
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: (){
                if(((gifData.user?.username?.isEmpty ??true)? gifData.user?.displayName.fCaps : gifData.user?.username.fCaps ?? "") == null){
                  return;
                }
                showModalBottomSheet(context: context, builder: (context) => BottomSheet(
                  onClosing: (){},
                  builder: (context) => Container(
                    color: AppColors.purpleColors.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.white, width: 2),
                                            borderRadius: BorderRadius.circular(1000)
                                        ),
                                        child: ClipOval(
                                            child: ImageUtils.showCachedImage(
                                                url: gifDataList[index].user?.avatarUrl ?? "",
                                                errorWidget: const Icon(Icons.person, color: AppColors.purpleColors,)
                                            )
                                        ),
                                      ),
                                      KSpace.w8,
                                      Text(((gifData.user?.username?.isEmpty ??true)? gifData.user?.displayName.fCaps : gifData.user?.username.fCaps ?? "").toString(), style: const TextStyle().black.s14.w7.ellipsis,),
                                      if(gifData.user?.instagramUrl?.isNotEmpty ?? false)KSpace.w8,
                                      if(gifData.user?.instagramUrl?.isNotEmpty ?? false)Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.lightBlueAccent, width: 1),
                                          borderRadius: BorderRadius.circular(1000)
                                        ),
                                        child: InkWell(
                                          onTap: (){
                                            launchUrl(Uri.parse(gifData.user?.instagramUrl ?? ""), mode: LaunchMode.inAppBrowserView);
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(1000),
                                            child: ImageUtils.showCachedImage(
                                              url: AppUrl.instagramUrl,
                                              height: 30,
                                              width: 30,
                                              fit: BoxFit.fill
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
                          Text(gifDataList[index].user?.description ?? ""),
                        ],
                      ),
                    ),
                  )
                ));
              },
              child: Stack(
                children: [
                  ImageUtils.showCachedImage(
                    url: gifDataList[index].images?.original?.url,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: AppColors.white, width: 2),
                                          borderRadius: BorderRadius.circular(1000)
                                      ),
                                      child: ClipOval(
                                          child: ImageUtils.showCachedImage(
                                              url: gifDataList[index].user?.avatarUrl ?? "",
                                              errorWidget: const Icon(Icons.person, color: AppColors.purpleColors,)
                                          )
                                      ),
                                    ),
                                    KSpace.w8,
                                    Flexible(child: AnimatedTextWithPersistence(displayName: gifData.user?.username.fCaps ?? "", username: gifData.user?.displayName.fCaps ?? "",)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onFavoriteToggle(gifDataList[index].images?.original?.url ?? ""),
                            child: Obx(() => Icon(
                              isFavorite(gifDataList[index].images?.original?.url ?? "") ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite(gifDataList[index].images?.original?.url ?? "") ? Colors.red : Colors.redAccent,
                              size: 30,
                            )),
                          ),
                        ],
                      ),
                      KSpace.kShrink
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


