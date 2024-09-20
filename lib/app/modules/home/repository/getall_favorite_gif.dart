// // favoriteGifRepository.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:logger/logger.dart';
//
// class FavoriteGifRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final logger = Logger();
//
//   Future<List<String>> getFavoriteGifs(String userId) async {
//     try {
//       QuerySnapshot snapshot = await _firestore
//           .collection('favorites')
//           .where('userId', isEqualTo: userId)
//           .get();
//
//       // Extract GIF URLs from the documents
//       List<String> gifUrls = snapshot.docs
//           .map((doc) => doc['gifUrl'] as String)
//           .toList();
//       return gifUrls;
//     } catch (e) {
//       logger.e('Error fetching favorite GIFs: $e');
//       throw Exception('Error fetching favorite GIFs');
//     }
//   }
//
// }
