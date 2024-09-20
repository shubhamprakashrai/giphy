import 'package:flutter/foundation.dart';
import 'package:giphyapp/app/data/apiService.dart';
import 'package:giphyapp/app/modules/home/models/gif_trendingmodels.dart';
import 'package:giphyapp/app/resource/app_url.dart';

class TrendingGif {
  static final _apiService = APIService();
  Future<GiphyResponse?> getTrendingGifs({required String apiKey, int limit = 1, required int offset}) async {
    Map<String, String> trendingMap = {
      "api_key": apiKey,
      "limit": limit.toString(),
      "offset":offset.toString()
    };
    try {
      final response = await _apiService.getApi(
          queryParams: trendingMap, url: AppUrl.trendingUrl);
      if (response != null) {
        debugPrint("response in repo $response");
        // var a = GiphyResponse.fromJson(response);
        // print("here data from model ${a.data}");
        return GiphyResponse.fromJson(response);
      } else {
        if (kDebugMode) {
          print('Error: Failed to fetch trending GIFs');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return null;
    }
  }
}
