import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/models/search_gifmodels.dart';
import 'package:giphyapp/app/modules/home/repository/favoriteGifRepo.dart';
import 'package:giphyapp/app/modules/home/repository/searchGifRepo.dart';
import 'package:giphyapp/app/modules/home/repository/trendingGifRepo.dart';
import 'package:giphyapp/app/utils/app_constant/app_url.dart';
import 'package:giphyapp/app/services/app_type_def.dart';
import 'package:giphyapp/app/services/language_service.dart';

import '../../../services/firbaseService/firebaseService.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();
  var gifUrls = <String>[].obs;
  var gifData = <Datum>[].obs;
  var isLoading = false.obs;
  var isSearching = false.obs;
  var currentQuery = ''.obs;
  var limit = 10;
  var offset = 0;
  var favoriteGifUrls = <String>{}.obs;
  RxBool isFav = false.obs;
  final FavoriteGifRepository _favoriteGifRepository = FavoriteGifRepository();

  @override
  void onInit() {
    super.onInit();
    fetchTrendingGifs();
    setupScrollListener();
    fetchFavoriteGifs();
    debugPrint("home page init call");
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (isSearching.value) {
          searchGifs(currentQuery.value);
        } else {
          fetchTrendingGifs();
        }
      }
    });
  }

  FVoid fetchTrendingGifs() async {
    if (isLoading.value || isSearching.value) return;
    isLoading.value = true;
    try {
      final response = await TrendingGif().getTrendingGifs(
        apiKey: AppUrl.apiKey,
        limit: limit,
        offset: offset,
      );

      if (response != null) {
        for (int i = 0; i < (response.data?.length ?? 0); i++) {
          gifUrls.add(response.data?[i].images?.original?.url ?? "");
          gifData.add(response.data![i]);
        }
        offset += 1;
        log.d("Offset is $offset");
      } else {
        debugPrint('Failed to fetch GIF');
      }
    }
    // on HttpException catch(e){
    //   if (e.message.contains('429')) {
    //   debugPrint('API rate limit exceeded, retrying...');
    //   await Future.delayed(Duration(seconds: 2));
    //   fetchTrendingGifs();
    // } else {
    //   debugPrint('Error fetching trending GIFs: $e');
    // }
    // }
    catch (e) {
      debugPrint("Error fetching trending GIFs: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void removeGif(int index) {
    gifUrls.removeAt(index);
  }

  FVoid searchGifs(String query) async {
    if (isLoading.value) return;

    if (query.isEmpty) {
      isSearching.value = false;
      gifUrls.clear();
      gifData.clear();
      offset = 0;
      return fetchTrendingGifs();
    }
    if (currentQuery.value != query) {
      // If the query has changed, reset the pagination and results
      offset = 0;
      gifUrls.clear();
    }
    isLoading.value = true;
    currentQuery.value = query;
    isSearching.value = true;

    try {
      final GifModels? response = await SearchGifRepo().getSearchGif(
        apiKey: AppUrl.apiKey,
        limit: limit,
        offset: offset,
        queryText: query,
      );
      // debugPrint("+++++++++++++++++${response!.}");
      if (response != null) {
        // response.data.forEach((element) {
        //   debugPrint("element here ${element.images.}");
        // });
        gifData.value = response.data;
        for (int i = 0; i < response.data.length; i++) {
          debugPrint("========== ${response.data[i].images!.downsized!.url}");
          gifUrls.add(response.data[i].images!.downsized!.url);
          offset += 1;
        }
      } else {
        debugPrint('Failed to fetch search GIFs');
      }
    } catch (e) {
      debugPrint("Error fetching search GIFs: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavoriteGif(String gifUrl) {
    if (favoriteGifUrls.contains(gifUrl)) {
      favoriteGifUrls.remove(gifUrl);
      _favoriteGifRepository.removeGifFromFavorites(gifUrl);
    } else {
      favoriteGifUrls.add(gifUrl);
      _favoriteGifRepository.addGifToFavorites(gifUrl);
    }
    // favoriteGifUrls.refresh();
  }

  bool isFavorite(String gifUrl) {
    return favoriteGifUrls.contains(gifUrl);
  }

  final FirebaseService _firebaseService = FirebaseService();

  FVoid fetchFavoriteGifs() async {
    debugPrint("++++++++++");
    try {
      final currentUser = _firebaseService.getCurrentUser();
      if (currentUser != null) {
        final userId = currentUser.uid;
        final List<String> fetchedFavorites =
            await _favoriteGifRepository.getFavoriteEmojis(userId);
        favoriteGifUrls.addAll(fetchedFavorites);
      } else {
        debugPrint("User is not logged in");
      }
    } catch (e) {
      debugPrint("Error fetching favorite GIFs: $e");
    }
  }
}
