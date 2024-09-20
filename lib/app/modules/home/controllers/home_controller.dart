import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/models/search_gifmodels.dart';
import 'package:giphyapp/app/modules/home/repository/favoriteGifRepo.dart';
import 'package:giphyapp/app/modules/home/repository/searchGifRepo.dart';
import 'package:giphyapp/app/modules/home/repository/trendingGifRepo.dart';
import 'package:giphyapp/app/resource/app_url.dart';
import 'package:giphyapp/app/utils/firbaseService/firebaseService.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();
  var gifUrls = <String>[].obs;
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

  void fetchTrendingGifs() async {
    if (isLoading.value || isSearching.value) return;
    isLoading.value = true;
    try {
      final response = await TrendingGif().getTrendingGifs(
        apiKey: AppUrl.apiKey,
        limit: limit,
        offset: offset,
      );

      if (response != null) {
        for (int i = 0; i < response.data.length; i++) {
          gifUrls.add(response.data[i].images.original.url);
        }
        offset += 1;
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

  void searchGifs(String query) async {
    if (isLoading.value) return;

    if (query.isEmpty) {
      isSearching.value = false;
      gifUrls.clear();
      offset = 0;
      await Future.delayed(const Duration(milliseconds: 100));
      fetchTrendingGifs();
      return;
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
  void fetchFavoriteGifs() async {
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
