


import '../../../services/firbaseService/firebase_service.dart';

class ForgetRepository {
  final FirebaseService _firebaseService=FirebaseService();

  Future<void> resetPassword(String email) async {
    await _firebaseService.resetPassword(email);
  }
}
