import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final bool isEmailVerified;
  final bool isAnonymous;
  final DateTime? creationTime;
  final DateTime? lastSignInTime;
  final String? phoneNumber;
  final String? photoURL;
  final bool isNewUser;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    required this.isEmailVerified,
    required this.isAnonymous,
    this.creationTime,
    this.lastSignInTime,
    this.phoneNumber,
    this.photoURL,
    required this.isNewUser,
  });


  factory UserModel.fromFirebaseUser(User user, bool isNewUser) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      isEmailVerified: user.emailVerified,
      isAnonymous: user.isAnonymous,
      creationTime: user.metadata.creationTime,
      lastSignInTime: user.metadata.lastSignInTime,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
      isNewUser: isNewUser,
    );
  }

  bool get userAlreadyExists {
    return !isNewUser && creationTime != null;
  }
}
