


import '../../../services/firbaseService/firebaseService.dart';

class FavoriteGifRepository {

  FavoriteGifRepository._privateConstructor();
  static final FavoriteGifRepository _instance = FavoriteGifRepository._privateConstructor();
  factory FavoriteGifRepository() => _instance;

  final FirebaseService _firebaseService = FirebaseService();

  Future<void> addGifToFavorites(String gifUrl) async {
    final user = _firebaseService.getCurrentUser();
    if (user != null) {
      await _firebaseService.addFavoriteGif(gifUrl, user.uid);
    }
  }

  Future<void> removeGifFromFavorites(String gifUrl) async {
    final user = _firebaseService.getCurrentUser();
    if (user != null) {
      await _firebaseService.removeFavoriteGif(gifUrl, user.uid);
    }
  }


  Future<List<String>> getFavoriteEmojis(String userId) async {
    return await _firebaseService.getFavoriteEmojis(userId);
  }

}
