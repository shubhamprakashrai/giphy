import 'package:flutter/material.dart';
import 'package:giphyapp/app/data/apiService.dart';
import 'package:giphyapp/app/modules/home/models/search_gifmodels.dart';
import 'package:giphyapp/app/resource/app_url.dart';

class SearchGifRepo {
  static final _apiService = APIService();

  Future<GifModels?> getSearchGif(
      {required String apiKey,
      int limit = 1,
      required int offset,
      required queryText}) async {
    Map<String, String> trendingMap = {
      "api_key": apiKey,
      "limit": limit.toString(),
      "offset": offset.toString(),
      "q": queryText
    };
    try {
      final response = await _apiService.getApi(
          queryParams: trendingMap, url: AppUrl.searchGifUrl);
      if (response != null) {
        debugPrint("resonsce in repo search  $response");
        // var a = GiphyResponse.fromJson(response);
        // print("here data from model ${a.data}");
        return GifModels.fromJson(response);
      } else {
        print('Error: Failed to fetch getSearchGif GIFs');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
