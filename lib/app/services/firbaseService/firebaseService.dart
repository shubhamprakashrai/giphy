
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:logger/logger.dart';

class FirebaseService {

  FirebaseService._privateConstructor();
  static final FirebaseService _instance = FirebaseService._privateConstructor();
  factory FirebaseService() => _instance;
  
  final logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
      return UserModel.fromFirebaseUser(userCredential.user!, isNewUser);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Return null if the email is already in use
        logger.e('Error signing up: Email already in use');
        throw Exception('email-already-in-use');
      } else {
        logger.e('Error signing up: $e');
        throw Exception('signup-error');
      }
    } catch (e) {
      logger.e('Unknown error signing up: $e');
      throw Exception('unknown-error');
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(userCredential.user!, false);
    } catch (e) {
      logger.e('Error signing in: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      logger.e('Error signing out: $e');
    }
  }

  Future<void> postData(String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);
    } catch (e) {
      logger.e('Error posting data: $e');
    }
  }

  Future<QuerySnapshot> getData(String collection) async {
    try {
      return await _firestore.collection(collection).get();
    } catch (e) {
      logger.e('Error fetching data: $e');
      rethrow;
    }
  }

  
  Future<void> deleteData(String collection, String docId) async {
    try {
      // await _firestore.collection(collection).doc(docId).delete();
    } catch (e) {
      logger.e('Error deleting data: $e');
    }
  }

  User? getCurrentUser() {
    try {
      return _auth.currentUser;
    } catch (e) {
      logger.e('Error fetching current user: $e');
      return null;
    }
  }


Future<void> addFavoriteGif(String gifUrl, String userId) async {
    try {
      await _firestore.collection('favorites').add({
        'gifUrl': gifUrl,
        'userId': userId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      logger.e('Error adding favorite GIF: $e');
    }
  }

  Future<void> removeFavoriteGif(String gifUrl, String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('favorites')
          .where('gifUrl', isEqualTo: gifUrl)
          .where('userId', isEqualTo: userId)
          .get();
      for (var doc in snapshot.docs) {
        await _firestore.collection('favorites').doc(doc.id).delete();
      }
    } catch (e) {
      logger.e('Error removing favorite GIF: $e');
    }
  }

  Future<List<String>> getFavoriteEmojis(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('favorites')
          .where('userId', isEqualTo: userId)
          .get();

      List<String> emojiUrls = snapshot.docs
          .map((doc) => doc['gifUrl'] as String)
          .toList();
      return emojiUrls;
    } catch (e) {
      throw Exception('Error fetching favorite Gif $e');
    }
  }


  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      logger.e('Error sending password reset email: $e');
      throw Exception('password-reset-error');
    }
  }


}
