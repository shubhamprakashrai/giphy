
import 'package:flutter/foundation.dart';
import 'package:giphyapp/app/data/apiService.dart';
import 'package:giphyapp/app/modules/home/models/gif_trendingmodels.dart';
import 'package:giphyapp/app/utils/app_constant/app_url.dart';
import 'package:giphyapp/app/services/language_service.dart';

class TrendingGif {

  TrendingGif._privateConstructor();
  static final TrendingGif _instance = TrendingGif._privateConstructor();
  factory TrendingGif() => _instance;
  static final _apiService = APIService();
  Future<GiphyResponse?> getTrendingGifs({required String apiKey, int limit = 1, required int offset}) async {
    Map<String, String> trendingMap = {
      "api_key": apiKey,
      "limit": limit.toString(),
      "offset": offset.toString()
    };
    try {
      final response = await _apiService.getApi(queryParams: trendingMap, url: AppUrl.trendingUrl);
      // final response = jsonDecode(mocRes);
      if (response != null) {
        log.d("response in repo $response");
        // var a = GiphyResponse.fromJson(response);
        // print("here data from model ${a.data}");
        return GiphyResponse.fromJson(response);
      } else {
        if (kDebugMode) {
          print('Error: Failed to fetch trending GIFs ');
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


var mocRes = '''{
  "data": [
    {
      "id": "WKMpybryegGzoHUb4R",
      "url": "https://giphy.com/gifs/WKMpybryegGzoHUb4R",
      "images": {
        "original": {
          "url": "https://media0.giphy.com/media/WKMpybryegGzoHUb4R/giphy.gif?cid=17caa5c1dvn2dm4r7upvl78ayuu17t22s3tpnkhhjfqnzxuu&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "nwwjMpxV57hn4ny2kO",
      "url": "https://giphy.com/gifs/nwwjMpxV57hn4ny2kO",
      "images": {
        "original": {
          "url": "https://media3.giphy.com/media/nwwjMpxV57hn4ny2kO/giphy.gif?cid=17caa5c1bkipimql4gwxg98aldajj2dquq1tdx8ofg9n4jo7&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "nk2C49mUNljb1scZgY",
      "url": "https://giphy.com/gifs/nk2C49mUNljb1scZgY",
      "images": {
        "original": {
          "url": "https://media3.giphy.com/media/nk2C49mUNljb1scZgY/giphy.gif?cid=17caa5c1bkipimql4gwxg98aldajj2dquq1tdx8ofg9n4jo7&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "BjydFMORhpPYHaEX0i",
      "url": "https://giphy.com/gifs/BjydFMORhpPYHaEX0i",
      "images": {
        "original": {
          "url": "https://media4.giphy.com/media/BjydFMORhpPYHaEX0i/giphy.gif?cid=17caa5c1bkipimql4gwxg98aldajj2dquq1tdx8ofg9n4jo7&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "SVoWZgirFqXg5FNMb3",
      "url": "https://giphy.com/gifs/SVoWZgirFqXg5FNMb3",
      "images": {
        "original": {
          "url": "https://media2.giphy.com/media/SVoWZgirFqXg5FNMb3/giphy.gif?cid=17caa5c1bkipimql4gwxg98aldajj2dquq1tdx8ofg9n4jo7&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "nwwjMpxV57hn4ny2kO_2",
      "url": "https://giphy.com/gifs/nwwjMpxV57hn4ny2kO",
      "images": {
        "original": {
          "url": "https://media3.giphy.com/media/nwwjMpxV57hn4ny2kO/giphy.gif?cid=17caa5c1bkipimql4gwxg98aldajj2dquq1tdx8ofg9n4jo7&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "r4BmI9xUaDuKJQdd3l",
      "url": "https://giphy.com/gifs/r4BmI9xUaDuKJQdd3l",
      "images": {
        "original": {
          "url": "https://media3.giphy.com/media/r4BmI9xUaDuKJQdd3l/giphy.gif?cid=17caa5c1ush74uxwurggfyobl2jpkk6ce3lbbavhck389d1c&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    },
    {
      "id": "qSAXaSscOW69sAHfjT",
      "url": "https://giphy.com/gifs/qSAXaSscOW69sAHfjT",
      "images": {
        "original": {
          "url": "https://media2.giphy.com/media/qSAXaSscOW69sAHfjT/giphy.gif?cid=17caa5c1jiet6g47ak79e1rpvt4z29zdi379bqtvhuxhkzvl&ep=v1_gifs_trending&rid=giphy.gif&ct=g"
        }
      }
    }
  ],
  "meta": {
    "status": 200,
    "msg": "OK",
    "response_id": "response_123"
  },
  "pagination": {
    "total_count": 5000,
    "count": 8,
    "offset": 0
  }
}
''';